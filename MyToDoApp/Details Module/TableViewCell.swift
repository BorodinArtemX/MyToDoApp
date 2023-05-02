//
//  TableViewCell.swift
//  MyToDoApp
//
//  Created by Артем Бородин on 25/04/2023.
//

import UIKit

    final class TableViewCell: UITableViewCell {
        
        private let taskLabel = UILabel()
        lazy var dateLabel = UILabel()
        var onComplete: () -> Void = {}
        let date = "\(Date())"
        func todaysDateAsString() -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            let str = dateFormatter.string(from: Date())
            return str
        }
        
        
        private lazy var doneButton: UIButton = {
            let action = UIAction { [weak self] _ in
                self?.onComplete()
            }
           let button = UIButton(primaryAction: action)
            button.setImage(UIImage(systemName: "circle"), for: .normal)
            button.tintColor = .systemGray.withAlphaComponent(1)
            return button
        }()
        
     
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupLayout()
            dateLabel.text = todaysDateAsString()
            dateLabel.font = .systemFont(ofSize: 11)
            dateLabel.textColor = .lightGray
            UserSettings.userData = date
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup(with task: String) {
            taskLabel.text = task
            dateLabel.text = todaysDateAsString()
        }
        
        
        private func setupLayout() {
            addSubview(taskLabel)
            addSubview(dateLabel)
            addSubview(doneButton)
            
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            doneButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                dateLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 10),
                dateLabel.leadingAnchor.constraint(equalTo: taskLabel.leadingAnchor),
                dateLabel.trailingAnchor.constraint(equalTo: taskLabel.trailingAnchor),
                dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                doneButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])}
            
        }


