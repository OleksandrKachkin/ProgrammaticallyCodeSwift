//
//  HomeViewController.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 30.05.2022.
//

import SwiftUI

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  
  private let homeView = HomeView()
  private let progress = Progress(totalUnitCount: 2)
 
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    self.view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBlue
    
    homeView.progressView.observedProgress = progress
    
    progress.cancellationHandler = {
      print("Progress was stoped")
      self.configureUserVC()
      
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    var count: Int64 = 0
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
      
      if self.progress.isCancelled {
        timer.invalidate()
      }
      
      if self.progress.fractionCompleted == 1 {
        self.progress.cancel()
      }
      
      self.progress.completedUnitCount = count
      count += 1
    }
    
  }
  
  
  private func configureUserVC() {

    DispatchQueue.main.async {
      let userVC = UserViewController()
      userVC.modalPresentationStyle = .fullScreen
      userVC.modalTransitionStyle = .crossDissolve
      self.present(userVC, animated: true, completion: nil)
    }
  }
  
}



