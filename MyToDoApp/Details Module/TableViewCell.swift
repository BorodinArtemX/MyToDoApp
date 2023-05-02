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
        func todaysDateAsString() -> String{
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let str = dateFormatter.string(from: date)
            return str
        }
     
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupLayout()
            dateLabel.text = todaysDateAsString()
            dateLabel.font = .systemFont(ofSize: 11)
            dateLabel.textColor = .lightGray
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup(with task: String) {
            taskLabel.text = task
        }
        
        private func setupLayout() {
            addSubview(taskLabel)
            addSubview(dateLabel)
        
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                dateLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 10),
                dateLabel.leadingAnchor.constraint(equalTo: taskLabel.leadingAnchor),
                dateLabel.trailingAnchor.constraint(equalTo: taskLabel.trailingAnchor),
                dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])}
            
        }


