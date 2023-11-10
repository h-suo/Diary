//
//  DiaryTableViewCell.swift
//  Diary
//
//  Created by Erick on 2023/08/28.
//

import UIKit

final class DiaryTableViewCell: UITableViewCell {
    
    // MARK: - Static Property
    static let identifier = String(describing: DiaryTableViewCell.self)
    
    // MARK: - Private Property
    private let diaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private let dateAndBodyView: UIView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let creationDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return label
    }()
    
    private let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return imageView
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTableViewCell()
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Data
extension DiaryTableViewCell {
    func setupContent(_ diaryEntry: DiaryEntry) {
        titleLabel.text = diaryEntry.title
        creationDateLabel.text = diaryEntry.creationDate
        bodyLabel.text = diaryEntry.body
    }
    
    func setupWeatherIcon(_ image: UIImage?) {
        weatherImage.image = image
    }
}

// MARK: - Setup UI Object
extension DiaryTableViewCell {
    private func setupTableViewCell() {
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
    }
}

// MARK: - Configure UI
extension DiaryTableViewCell {
    private func configureUI() {
        configureContentView()
        configureDiaryStackView()
        configureDateAndBodyView()
    }
    
    private func configureContentView() {
        contentView.addSubview(diaryStackView)
    }
    
    private func configureDiaryStackView() {
        [titleLabel, dateAndBodyView].forEach {
            diaryStackView.addArrangedSubview($0)
        }
    }
    
    private func configureDateAndBodyView() {
        [creationDateLabel, weatherImage, bodyLabel].forEach {
            dateAndBodyView.addSubview($0)
        }
    }
}

// MARK: - Setup Constraint
extension DiaryTableViewCell {
    private func setupConstraints() {
        setupDiaryStackViewConstraints()
        setupCreationDateLabelConstraints()
        setupWeatherImageConstraints()
        setupBodyLabelConstraints()
    }
    
    private func setupDiaryStackViewConstraints() {
        NSLayoutConstraint.activate([
            diaryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            diaryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            diaryStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            diaryStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupCreationDateLabelConstraints() {
        NSLayoutConstraint.activate([
            creationDateLabel.leadingAnchor.constraint(equalTo: dateAndBodyView.leadingAnchor),
            creationDateLabel.centerYAnchor.constraint(equalTo: dateAndBodyView.centerYAnchor)
        ])
    }
    
    private func setupWeatherImageConstraints() {
        NSLayoutConstraint.activate([
            weatherImage.leadingAnchor.constraint(equalTo: creationDateLabel.trailingAnchor, constant: 4),
            weatherImage.topAnchor.constraint(equalTo: dateAndBodyView.topAnchor),
            weatherImage.bottomAnchor.constraint(equalTo: dateAndBodyView.bottomAnchor),
            weatherImage.widthAnchor.constraint(equalTo: weatherImage.heightAnchor, multiplier: 1.0)
        ])
    }
    
    private func setupBodyLabelConstraints() {
        NSLayoutConstraint.activate([
            bodyLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 4),
            bodyLabel.trailingAnchor.constraint(lessThanOrEqualTo: dateAndBodyView.trailingAnchor),
            bodyLabel.centerYAnchor.constraint(equalTo: dateAndBodyView.centerYAnchor)
        ])
    }
}
