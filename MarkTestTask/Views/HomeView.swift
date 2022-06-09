//
//  HomeView.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 31.05.2022.
//

import UIKit

class HomeView: UIView {
  
  // MARK: - Properties
  
  public let progressView: UIProgressView = {
    let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
    progressView.progress = 0.1
    progressView.progressTintColor = .red
    progressView.trackTintColor = .green
    return progressView
  }()
  
  private let imageView: UIImageView = {
    let imageArray = ["1", "2", "3", "4"]
    let imageView = UIImageView(image: UIImage(named: imageArray[Int.random(in: 0..<imageArray.count)]))
    imageView.contentMode = .scaleAspectFill
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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setConstraints()
  }
  
  private func addSubviews() {
    [progressView, imageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
  }
  
  // MARK: - Set constraints
  
  private func setConstraints() {

    NSLayoutConstraint.activate([
      progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
      progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
      progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
    ])

    NSLayoutConstraint.activate([
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
    ])
  }
  
}
