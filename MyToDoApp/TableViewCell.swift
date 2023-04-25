//
//  TableViewCell.swift
//  MyToDoApp
//
//  Created by Артем Бородин on 25/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {


    final class TableViewCell: UITableViewCell {
        
        private let taskLabel = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup(with task: String) {
            taskLabel.text = task
        }
        
        private func setupLayout() {
            addSubview(taskLabel)
            
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                taskLabel.topAnchor.constraint(equalTo: topAnchor,constant: 10),
                taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
            ])}
            
        }

}
