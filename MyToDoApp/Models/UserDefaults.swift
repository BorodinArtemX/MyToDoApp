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

final class UserSettings {
    
    private enum SettingsKeys: String {
        case userData
    }
    
    static var userData: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userData.rawValue)
        } set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userData.rawValue
            if let data = newValue {
                defaults.set(data, forKey: key)
            }
        }
    }
}
