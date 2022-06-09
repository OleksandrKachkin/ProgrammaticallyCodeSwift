//
//  UserDefaults.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 09.06.2022.
//

import Foundation

struct SavedProperties {
  
  static var userName: String {
    get {
      return UserDefaults.standard.string(forKey: "userName") ?? "User Name"
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "userName")
    }
  }
  
  static var launchedBefore: Bool {
    get {
      return UserDefaults.standard.bool(forKey: "launchedBefore")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "launchedBefore")
    }
  }
}


