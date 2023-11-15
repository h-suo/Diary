//
//  DiaryViewController.swift
//  Diary
//
//  Created by Erick on 2023/08/30.
//

import UIKit

typealias LocationData = (latitude: String, longitude: String)

final class DiaryEditViewController: UIViewController, AppResignObservable {
    
    // MARK: - Private Property
    private let diaryManager: DiaryManageable
    private let networkManager: NetworkManager
    private var diaryEntry: DiaryEntry?
    private let locationData: LocationData?
    private let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.addObserveKeyboardNotification()
        
        return textView
    }()
    
    // MARK: - Property
    weak var delegate: DiaryEditViewControllerDelegate?
    
    // MARK: - Initializer
    init(diaryManager: DiaryManageable, networkManager: NetworkManager, diaryEntry: DiaryEntry?, locationData: LocationData?) {
        self.diaryManager = diaryManager
        self.networkManager = networkManager
        self.diaryEntry = diaryEntry
        self.locationData = locationData
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContentTextView()
        setupUIObject()
        configureUI()
        setupConstraints()
        addObserveWillResignActive(observer: self, selector: #selector(endEditingAndPop))
    }
}

// MARK: - Setup Data
extension DiaryEditViewController {
    private func setupContentTextView() {
        if let diaryEntry = diaryEntry {
            textView.text = String(format: NameSpace.diaryFormat, diaryEntry.title, diaryEntry.body)
        }
    }
    
    private func storeDiary(title: String, body: String, weatherResponse: WeatherResponse?) {
        do {
            if var diaryEntry {
                diaryEntry.title = title
                diaryEntry.body = body
                try diaryManager.updateDiary(diaryEntry)
                delegate?.diaryEditViewController(self, updateDiary: true)
            } else {
                try diaryManager.createDiary(title: title, body: body, weatherResponse: weatherResponse)
                delegate?.diaryEditViewController(self, updateDiary: true)
            }
        } catch {
            self.presentFailAlert()
        }
    }
}

// MARK: - Setup UI Object
extension DiaryEditViewController {
    private func setupUIObject() {
        setupView()
        setupNavigationItem()
        setupTextView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationItem() {
        if diaryEntry == nil {
            let completButton = UIBarButtonItem(title: NameSpace.done, style: .plain, target: self, action: #selector(endEditingAndPop))
            navigationItem.title = DateFormatManager.dateString(localeDateFormatter: UserDateFormatter.shared)
            navigationItem.rightBarButtonItem = completButton
        } else {
            let moreButton = UIBarButtonItem(image: UIImage(systemName: NameSpace.ellipsis), style: .plain, target: self, action: #selector(presentMoreActionSheet))
            navigationItem.title = diaryEntry?.creationDate
            navigationItem.rightBarButtonItem = moreButton
        }
    }
    
    private func setupTextView() {
        textView.delegate = self
        
        if diaryEntry == nil {
            textView.becomeFirstResponder()
        }
    }
}

// MARK: - Push & Present Controller
extension DiaryEditViewController {
    @objc private func presentMoreActionSheet() {
        let cancelAction = UIAlertAction(title: NameSpace.cancel, style: .cancel)
        let shareAction = UIAlertAction(title: NameSpace.share, style: .default) { _ in
            guard let diaryEntry = self.diaryEntry else {
                self.presentFailAlert()
                return
            }
            
            ActivityViewManager.presentActivityView(to: self, with: diaryEntry)
        }
        let deleteAction = UIAlertAction(title: NameSpace.delete, style: .destructive) { _ in
            guard let diaryEntry = self.diaryEntry else {
                self.presentFailAlert()
                return
            }
            
            self.presentDeleteAlert(diaryEntry: diaryEntry)
        }
        
        let actionSheet = AlertManager()
            .setStyle(.actionSheet)
            .setActions([shareAction, deleteAction, cancelAction])
            .buildAlert()
        
        present(actionSheet, animated: true)
    }
    
    private func presentDeleteAlert(diaryEntry: DiaryEntry) {
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            guard let self else {
                return
            }
            
            do {
                try diaryManager.deleteDiary(diaryEntry)
                delegate?.diaryEditViewController(self, updateDiary: true)
                navigationController?.popViewController(animated: true)
            } catch {
                presentFailAlert()
            }
        }
        
        let alert = AlertManager
            .deleteAlertManager()
            .setAction(deleteAction)
            .buildAlert()
        
        present(alert, animated: true)        
    }
    
    private func presentFailAlert() {
        let alert = AlertManager
            .failAlertManager()
            .setMessage(NameSpace.failMessage)
            .buildAlert()
        
        present(alert, animated: true)
    }
}

// MARK: - TextView Delegate
extension DiaryEditViewController: UITextViewDelegate {
    @objc private func endEditingAndPop() {
        textView.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let diaryContents = textView.text.components(separatedBy: NameSpace.enter).filter { $0.isEmpty == false }
        
        guard let title = diaryContents.first,
              !diaryContents.isEmpty else {
            return
        }
        
        let body = diaryContents.dropFirst().joined(separator: NameSpace.enter)
        
        guard let locationData,
              let endPoint = CurrentWeatherEndPoint(lat: locationData.latitude, lon: locationData.longitude) else {
            storeDiary(title: title, body: body, weatherResponse: nil)
            return
        }
        
        networkManager.request(with: endPoint) { result in
            switch result {
            case .success(let weatherResponse):
                self.storeDiary(title: title, body: body, weatherResponse: weatherResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Configure UI
extension DiaryEditViewController {
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        view.addSubview(textView)
    }
}

// MARK: - Setup Constraint
extension DiaryEditViewController {
    private func setupConstraints() {
        setupTextViewConstraint()
    }
    
    private func setupTextViewConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            textView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            textView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

// MARK: - Name Space
extension DiaryEditViewController {
    private enum NameSpace {
        static let share = "share..."
        static let delete = "Delete"
        static let cancel = "Cancel"
        static let done = "완료"
        static let ellipsis = "ellipsis"
        static let enter = "\n"
        static let diaryFormat = "%@\n%@"
        static let failMessage = "작업에 실패했습니다."
    }
}
