//
//  UserViewController.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 30.05.2022.
//

import SwiftUI

class UserViewController: UIViewController {
  
  
  // MARK: - View
  
  private let topLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .systemGreen
    label.text = "Welcome to my AppGaming"
    label.font = .systemFont(ofSize: 32, weight: .regular)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var profileView: UIView = {
    let view = UIView()
    
    view.addSubview(profileImageView)
    profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    profileImageView.anchor(top: view.topAnchor, paddingTop: 10, width: 200, height: 200)
    profileImageView.layer.cornerRadius = 100
    
    view.addSubview(profileImageButton)
    profileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    profileImageButton.anchor(top: profileImageView.bottomAnchor, paddingTop: -50, width: 150, height: 40)
    return view
  }()
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profilePicture")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.borderWidth = 3
    imageView.layer.borderColor = UIColor.white.cgColor
    return imageView
  }()
  
  private let profileImageButton: UIButton = {
    let image = UIImage(systemName: "camera.fill")
    let title = "Change picture"
    
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.setImage(image, for: .normal)
    button.tintColor = .systemBlue
    button.addTarget(self, action: #selector(handleProfileImage), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
    
  }()
  
  
  lazy var nameView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    
    view.layer.cornerRadius = 10
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 15
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.red.cgColor
    
    view.addSubview(editNameButton)
    editNameButton.anchor(left: view.leftAnchor, paddingLeft: 10, width: 30, height: 30)
    
    view.addSubview(nameTextField)
    nameTextField.anchor(top: view.topAnchor, left: editNameButton.rightAnchor, paddingTop: 5, paddingLeft: 5, width: 200)
    
    return view
  }()
  
  private let editNameButton: UIButton = {
    let image = UIImage(systemName: "square.and.pencil")
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 50, y: 100, width: 20, height: 20)
    button.setImage(image, for: .normal)
    button.addTarget(self, action: #selector(didTapEditNameButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let nameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter your name"
    textField.textAlignment = .left
    textField.borderStyle = UITextField.BorderStyle.none
    textField.textColor = UIColor.black
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let saveButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Save and Continue", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
    button.backgroundColor = .white
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let skipButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Skip", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
//    button.backgroundColor = .systemPurple
    //    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  
  private let bottomLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .systemGreen
    label.text = "You can always change information in Profile settings"
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 16, weight: .bold)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [topLabel, profileView, nameView, saveButton, skipButton, bottomLabel])
    stack.axis = .vertical
    stack.distribution = .fill
    stack.alignment = .center
    stack.spacing = 20
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBrown
    //    createStackView()
    
    
    setupView()
    setConstraints()
    
  }
  
  // MARK: - Setup view
  
  private func setupView() {
    view.addSubview(stackView)
    //    nameView.addSubview(editNameButton)
    //    nameView.addSubview(nameTextField)
  }
  
  // MARK: - Set constraints
  
  func setConstraints() {
    
    // topLabel constraints
    topLabel.anchor(top: stackView.topAnchor, left: stackView.leftAnchor, right: stackView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, height: 80)
    
    // profileView constraints
    profileView.anchor(top: topLabel.bottomAnchor, paddingTop: 20, width: 200, height: 210)
    
    // nameView constraints
    nameView.anchor(top: topLabel.bottomAnchor, paddingTop: 250, width: 250, height: 30)
    
    // saveButton
    saveButton.anchor(top: nameView.bottomAnchor, paddingTop: 20, width: 200, height: 60)
    
    // skipButton
    skipButton.anchor(top: saveButton.bottomAnchor, paddingTop: 20, width: 100, height: 30)

    // bottomLabel
    bottomLabel.anchor(top: skipButton.bottomAnchor, left: stackView.leftAnchor, bottom: view.bottomAnchor, right: stackView.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingBottom: 50, paddingRight: 20, height: 80)
    
    // stackView constraints
    stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
  }
  
  
  
  // MARK: - Selectors
  
  @objc func didTapEditNameButton() {
    
  }
  
  @objc func handleSaveButton() {
    
  }
  
  @objc func didTapSkipButton() {
    
  }
  
  @objc func handleProfileImage() {
    
  }
  
  
}

// MARK: - Show Canvas like SwiftUI

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = UserViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UserViewController, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController().edgesIgnoringSafeArea(.all)
  }
}




