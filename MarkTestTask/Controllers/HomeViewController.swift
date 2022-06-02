//
//  HomeViewController.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 30.05.2022.
//

import SwiftUI

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  
  let progress = Progress(totalUnitCount: 12)
  
  private let progressView: UIProgressView = {
    let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
    progressView.progress = 0.1
    progressView.progressTintColor = .red
    progressView.trackTintColor = .green
    progressView.translatesAutoresizingMaskIntoConstraints = false
    return progressView
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "homeViewImage"))
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBlue
    view.addSubview(progressView)
    view.addSubview(imageView)
    setConstraints()
    
    progressView.observedProgress = progress
    
    progress.cancellationHandler = {
      print("Progress was stoped")
      self.configureUserVC()
      
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
  
  
  private func configureUserVC() {

    DispatchQueue.main.async {
      let userVC = UserViewController()
      userVC.modalPresentationStyle = .fullScreen
      userVC.modalTransitionStyle = .crossDissolve
      self.present(userVC, animated: true, completion: nil)
    }
    
  }
  
  
  
  // MARK: - Set constraints
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
    ])
    
    NSLayoutConstraint.activate([
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
    ])
  }
  
  
}



