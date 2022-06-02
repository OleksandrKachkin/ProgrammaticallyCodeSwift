//
//  HomeView.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 31.05.2022.
//

import UIKit

class HomeView: UIView {
  
  // MARK: - Properties
  
  let progress = Progress(totalUnitCount: 12)
  
  private let progressView: UIProgressView = {
    let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
    //    progressView.center = view.center
    progressView.progress = 0.1
    progressView.progressTintColor = .red
    progressView.trackTintColor = .green
    progressView.translatesAutoresizingMaskIntoConstraints = false
    return progressView
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "homeView"))
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // MARK: - Inits
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func addSubviews() {
    addSubview(progressView)
    addSubview(imageView)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setConstraints()
  }
  
  
  // MARK: - Set constraints
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ])
  }
}
