//
//  Diary - DiaryListViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import CoreLocation
import UIKit

final class DiaryListViewController: UIViewController {
  
  // MARK: - Private Property
  private let diaryReader: DiaryReadable
  private let diaryManager: DiaryManageable
  
  private let networkManager: NetworkManageable
  
  private let loactionManager: CLLocationManager
  private var locationData: LocationData?
  
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    return tableView
  }()
  
  private lazy var dataSource: UITableViewDiffableDataSource = {
    let dataSource = UITableViewDiffableDataSource<Section, DiaryEntry>(
      tableView: tableView,
      cellProvider: { tableView, indexPath, itemIdentifier in
        
        guard let cell = tableView.dequeueReusableCell(
          withIdentifier: DiaryTableViewCell.identifier,
          for: indexPath
        ) as? DiaryTableViewCell else {
          return UITableViewCell()
        }
        
        cell.setupContent(itemIdentifier)
        
        guard let weatherIconId = itemIdentifier.weatherIconID else {
          return cell
        }
        
        do {
          let url = try WeatherIconEndPoint(iconId: weatherIconId).url()
          
          self.networkManager.request(with: url) { result in
            switch result {
            case .success(let data):
              let weatherIcon = UIImage(data: data)
              
              DispatchQueue.main.async {
                cell.setupWeatherIcon(weatherIcon)
              }
            case .failure(let error):
              print(error.localizedDescription)
            }
          }
        } catch {
          print(error.localizedDescription)
        }
        
        return cell
      }
    )
    
    return dataSource
  }()
  
  // MARK: - Initializer
  init(
    diaryReader: DiaryReadable,
    diaryManager: DiaryManageable,
    networkManager: NetworkManageable
  ) {
    self.diaryReader = diaryReader
    self.diaryManager = diaryManager
    self.networkManager = networkManager
    self.loactionManager = CLLocationManager()
    self.locationData = nil
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View State Method
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUIObject()
    configureUI()
    setupConstraints()
    setupContentTableView()
    setupLocationManager()
  }
}

// MARK: - Setup Data
extension DiaryListViewController {
  
  @objc private func setupContentTableView() {
    do {
      let diaryEntrys = try diaryReader.diaryEntrys()
      var snapshot = NSDiffableDataSourceSnapshot<Section, DiaryEntry>()
      snapshot.appendSections([.main])
      snapshot.appendItems(diaryEntrys)
      dataSource.apply(snapshot)
    } catch {
      presentFailDataLoadAlert()
    }
  }
}

// MARK: - Setup UI Object
extension DiaryListViewController {
  
  private func setupUIObject() {
    setupView()
    setupNavigationItem()
    setupTableView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
  }
  
  private func setupNavigationItem() {
    let plusButton = UIBarButtonItem(
      image: UIImage(systemName: NameSpace.plus),
      style: .plain,
      target: self,
      action: #selector(pushDiaryViewController)
    )
    
    navigationItem.title = NameSpace.diary
    navigationItem.rightBarButtonItem = plusButton
  }
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.register(
      DiaryTableViewCell.self,
      forCellReuseIdentifier: DiaryTableViewCell.identifier
    )
  }
}

// MARK: - Setup Location Manager
extension DiaryListViewController: CLLocationManagerDelegate {
  
  private func setupLocationManager() {
    loactionManager.delegate = self
    loactionManager.desiredAccuracy = kCLLocationAccuracyBest
    loactionManager.requestWhenInUseAuthorization()
    loactionManager.startUpdatingLocation()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    
    guard let location = locations.last else {
      return
    }
    
    let latitude = location.coordinate.latitude
    let longitude = location.coordinate.longitude
    
    locationData = (String(latitude), String(longitude))
  }
}

// MARK: - Push & Present Controller
extension DiaryListViewController {
  
  @objc private func pushDiaryViewController() {
    let diaryViewController = DiaryEditViewController(
      diaryManager: diaryManager,
      networkManager: networkManager,
      diaryEntry: nil,
      locationData: locationData
    )
    
    diaryViewController.delegate = self
    
    navigationController?.pushViewController(diaryViewController, animated: true)
  }
  
  @objc private func presentFailAlert() {
    let alert = AlertManager
      .failAlertManager()
      .setMessage(NameSpace.failOperation)
      .buildAlert()
    
    present(alert, animated: true)
  }
  
  private func presentFailDataLoadAlert() {
    let alert = AlertManager
      .failAlertManager()
      .setMessage(NameSpace.failLoadData)
      .buildAlert()
    
    present(alert, animated: true)
  }
  
  private func presentDeleteAlert(diaryEntry: DiaryEntry) {
    let deleteAction = UIAlertAction(
      title: NameSpace.delete,
      style: .destructive,
      handler: { [weak self] _ in
        
        guard let self else {
          return
        }
        
        do {
          try diaryManager.deleteDiary(diaryEntry)
          setupContentTableView()
        } catch {
          presentFailAlert()
        }
      }
    )
    
    let alert = AlertManager
      .deleteAlertManager()
      .setAction(deleteAction)
      .buildAlert()
    
    present(alert, animated: true)
  }
}

// MARK: - TableView Delegate
extension DiaryListViewController: UITableViewDelegate {
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    do {
      let diaryEntry = try diaryReader.diaryEntrys()[indexPath.row]
      let diaryViewController = DiaryEditViewController(
        diaryManager: diaryManager,
        networkManager: networkManager,
        diaryEntry: diaryEntry,
        locationData: nil
      )
      
      diaryViewController.delegate = self
      
      navigationController?.pushViewController(diaryViewController, animated: true)
    } catch {
      presentFailDataLoadAlert()
    }
  }
  
  func tableView(
    _ tableView: UITableView,
    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
  ) -> UISwipeActionsConfiguration? {
    let shareAction = UIContextualAction(
      style: .normal,
      title: NameSpace.share,
      handler: { [weak self] (_, _, success: @escaping (Bool) -> Void) in
        
        guard let self else {
          return
        }
        
        do {
          let diaryEntrys = try diaryReader.diaryEntrys()
          let diaryEntry = diaryEntrys[indexPath.row]
          ActivityViewManager.presentActivityView(to: self, with: diaryEntry)
          success(true)
        } catch {
          presentFailAlert()
          success(false)
        }
      }
    )
    
    let deleteAction = UIContextualAction(
      style: .destructive,
      title: NameSpace.delete,
      handler: { [weak self] (_, _, success: @escaping (Bool) -> Void) in
        guard let self else {
          return
        }
        
        do {
          let diaryEntrys = try diaryReader.diaryEntrys()
          presentDeleteAlert(diaryEntry: diaryEntrys[indexPath.row])
          success(true)
        } catch {
          presentFailAlert()
          success(false)
        }
      }
    )
    
    return UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
  }
}

// MARK: - DiaryEditViewControllerDelegate
extension DiaryListViewController: DiaryEditViewControllerDelegate {
  
  func diaryEditViewController(
    _ diaryViewController: DiaryEditViewController,
    updateDiary isSuccess: Bool
  ) {
    if isSuccess {
      setupContentTableView()
    }
  }
}

// MARK: - Configure UI
extension DiaryListViewController {
  
  private func configureUI() {
    configureView()
  }
  
  private func configureView() {
    view.addSubview(tableView)
  }
}

// MARK: - Setup Constraint
extension DiaryListViewController {
  
  private func setupConstraints() {
    setupTableViewConstraint()
  }
  
  private func setupTableViewConstraint() {
    let safeArea = view.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
    ])
  }
}

// MARK: - TableView Section
extension DiaryListViewController {
  
  private enum Section {
    case main
  }
}
