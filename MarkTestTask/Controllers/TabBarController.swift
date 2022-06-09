//
//  MainViewController.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 03.06.2022.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(SavedProperties.userName)
    
    let vc1 = UINavigationController(rootViewController: FirstViewController())
    let vc2 = UINavigationController(rootViewController: SecondViewController())
    let vc3 = UINavigationController(rootViewController: ThirdViewController())
    let vc4 = UINavigationController(rootViewController: ForthViewController())
    let vc5 = UINavigationController(rootViewController: FifthViewController())
    
    vc1.title = "Home"
    vc2.title = "Contact"
    vc3.title = "Help"
    vc4.title = "About"
    vc5.title = "Settings"
    
    self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
    
    guard let items = self.tabBar.items else { return }
    
    let images = ["house", "bell", "person.circle", "star", "gear"]
    
    for x in 0..<items.count {
      items[x].image = UIImage(systemName: images[x])
    }
  }
}

class FirstViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemYellow
  }
}

class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .lightGray
  }
}

class ThirdViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBlue
  }
}


class ForthViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGray
  }
}

class FifthViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemTeal
  }
}
