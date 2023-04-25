//
//  ViewController.swift
//  MyToDoApp
//
//  Created by Артем Бородин on 13/04/2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        navigationItem.title = "MyToDoApp"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: <#T##Selector?#>)
        super.viewDidLoad()
        setupLeyout()
    }

    @objc func AddTapButton(){
        
        
    }
    
    
    
    func setupLeyout(){
        view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.topAnchor.constraint(equalTo: view.topAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

