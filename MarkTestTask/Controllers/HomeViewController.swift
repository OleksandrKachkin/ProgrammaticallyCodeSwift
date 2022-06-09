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
  private let progress = Progress(totalUnitCount: 16)
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    self.view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemTeal
    
    homeView.progressView.observedProgress = progress
    
    progress.cancellationHandler = {
      print("Progress was stoped")
      self.configureNextVC()
      
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    var count: Int64 = 0
    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
      
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
  
  
  private func configureNextVC() {

        DispatchQueue.main.async {

          if !SavedProperties.launchedBefore {
            print("First launch.")
            SavedProperties.launchedBefore = true
            let vc = UserViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)

          } else {
            print("Not first launch.")
            let vc = TabBarController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
          }
        }
    
  }
}

