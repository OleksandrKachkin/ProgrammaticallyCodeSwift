//
//  UserView.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 08.06.2022.
//

import UIKit

protocol UserViewDelegate: AnyObject {
  func didTapImagePicker()
  func didTapEditName()
  func didTapSaveButton()
  func didTapNextVC()
}

class UserView: UIView {
  
  // MARK: - Properties
  
  public weak var delegate: UserViewDelegate?
  
  private let welcomeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "Welcome"
    label.font = UIFont(name: "Roboto-Bold", size: 40)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  private let appGamingLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.changeFontColor(text: "to my AppGaming", otherColorText: "App", color: UIColor.systemBlue)
    label.font = UIFont(name: "Roboto-Medium", size: 35)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  lazy var profileView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    let cornerRadius: CGFloat = 100
    view.layer.cornerRadius = cornerRadius
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    view.layer.shadowRadius = 25
    view.layer.shadowOpacity = 0.9
    
    view.addSubview(profileImageView)
    profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    profileImageView.anchor( width: 200, height: 210)
    profileImageView.layer.cornerRadius = 100
    
    profileImageView.isUserInteractionEnabled = true
    let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapProfilePicture))
    profileImageView.addGestureRecognizer(gesture)
    return view
  }()
  
  public let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profilePicture")
    imageView.tintColor = .gray
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.borderWidth = 3
    imageView.layer.borderColor = UIColor.white.cgColor
    return imageView
  }()
  
  lazy var nameView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 12
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.lightGray.cgColor
    
    view.addSubview(editNameButton)
    editNameButton.anchor(left: view.leftAnchor, paddingLeft: 10, width: 30, height: 30)
    
    view.addSubview(nameField)
    nameField.anchor(top: view.topAnchor, left: editNameButton.rightAnchor, paddingTop: 5, paddingLeft: 5, width: 200)
    
    return view
  }()
  
  private let editNameButton: UIButton = {
    let image = UIImage(systemName: "square.and.pencil")
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 50, y: 100, width: 20, height: 20)
    button.setImage(image, for: .normal)
    button.addTarget(self, action: #selector(didTapEditNameButton), for: .touchUpInside)
    return button
  }()
  
  public let nameField: UITextField = {
    let field = UITextField()
    field.placeholder = "Enter your name"
    field.font = UIFont(name: "Roboto-Medium", size: 16)
    field.textAlignment = .left
    field.borderStyle = UITextField.BorderStyle.none
    field.textColor = UIColor.black
    field.translatesAutoresizingMaskIntoConstraints = false
    field.autocorrectionType = .no
    field.returnKeyType = .done
    field.backgroundColor = .white
    return field
  }()
  
  private let saveButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Save and Continue", for: .normal)
    button.backgroundColor = .link
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    button.layer.cornerRadius = 12
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
    return button
  }()
  
  private let skipButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Skip", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    button.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
    return button
  }()
  
  private let bottomLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Roboto-Regular", size: 11)
    label.textColor = UIColor.black.withAlphaComponent(0.5)
    label.text = "You can always change information in Profile settings"
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
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
    [welcomeLabel, appGamingLabel, profileView, nameView, saveButton, skipButton, bottomLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
  }
  
  // MARK: - Actions
  
  @objc private func didTapProfilePicture() {
    delegate?.didTapImagePicker()
  }
  
  @objc private func didTapEditNameButton() {
    delegate?.didTapEditName()
  }
  
  @objc private func didTapSaveButton() {
    delegate?.didTapSaveButton()
  }
  
  @objc private func didTapSkipButton() {
    delegate?.didTapNextVC()
  }
  
  
  // MARK: - Set constraints
  
  func setConstraints() {
    
    // welcomeLabel constraints
    NSLayoutConstraint.activate([
      welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//      welcomeLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    // appGamingLabel constraints
    NSLayoutConstraint.activate([
      appGamingLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: -10),
      appGamingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      appGamingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//      appGamingLabel.heightAnchor.constraint(equalToConstant: 35)
    ])
    
    // profileView constraints
    NSLayoutConstraint.activate([
      profileView.topAnchor.constraint(equalTo: appGamingLabel.bottomAnchor, constant: 20),
      profileView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      profileView.heightAnchor.constraint(equalToConstant: 210),
      profileView.widthAnchor.constraint(equalToConstant: 200)
    ])
    
    // nameView constraints
    NSLayoutConstraint.activate([
      nameView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 280),
      nameView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      nameView.heightAnchor.constraint(equalToConstant: 30),
      nameView.widthAnchor.constraint(equalToConstant: 250)
    ])
    
    // saveButton
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 20),
      saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      saveButton.heightAnchor.constraint(equalToConstant: 60),
      saveButton.widthAnchor.constraint(equalToConstant: 200)
    ])
    
    // skipButton
    NSLayoutConstraint.activate([
      skipButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
      skipButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      skipButton.heightAnchor.constraint(equalToConstant: 30),
      skipButton.widthAnchor.constraint(equalToConstant: 100)
    ])
    
    // bottomLabel
    NSLayoutConstraint.activate([
      bottomLabel.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 30),
      bottomLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      bottomLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      bottomLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
      bottomLabel.heightAnchor.constraint(equalToConstant: 80),
    ])
  }
}


