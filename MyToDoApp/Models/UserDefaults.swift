//
//  UserDefaults.swift
//  MyToDoApp
//
//  Created by Артем Бородин on 25/04/2023.
//

import Foundation

extension UserDefaults {
    var tasks: [String] {
        get { UserDefaults.standard.stringArray(forKey: "Tasks") ?? ["Clean home", "Feed cat"] }
        set { UserDefaults.standard.set(newValue, forKey: "Tasks")}
    }
}
