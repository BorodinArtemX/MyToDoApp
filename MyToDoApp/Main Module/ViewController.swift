//
//  ViewController.swift
//  MyToDoApp
//
//  Created by Артем Бородин on 13/04/2023.
//

import UIKit

final class ViewController: UIViewController {
        
        private lazy var myTableView: UITableView = {
            let tableView = UITableView()
            tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            tableView.dataSource = self
            tableView.delegate = self
            return tableView
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "MyToDoApp"
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .trash, target: self, action: .none)
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapButton))
            setupLayout()
        }
        
        
    
        @objc func addTapButton(){
            print("New Task")
            let alert = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
            alert.addTextField()
            let okAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
                guard let task = alert.textFields!.first?.text else { return }
                UserDefaults.standard.tasks.insert(task, at: 0)
                self.myTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in}
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
        
        private func setupLayout() {
            view.addSubview(myTableView)

            myTableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                myTableView.topAnchor.constraint(equalTo: view.topAnchor),
                myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .normal, title: "Delete") {  _,_,_  in
                
                UserDefaults.standard.tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            action.backgroundColor = .red
            let swipeConfig = UISwipeActionsConfiguration(actions: [action])
            return swipeConfig
        }
    }
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            UserDefaults.standard.tasks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.setup(with: UserDefaults.standard.tasks[indexPath.row])
            return cell
        }
        
    }
