//
//  UserViewController.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 30.05.2022.
//

import SwiftUI

class UserViewController: UIViewController {
  
  // MARK: - Properties
  
  private let userView = UserView()
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    self.view = userView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBrown
    
    userView.delegate = self
    userView.nameField.delegate = self
    
    // Dismiss keyboard textfield by typing anywhere on VC
    let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
    
  }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate, UserViewDelegate

extension UserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UserViewDelegate {
  
  // метод UserViewDelegate: предоставляет список действий (сделать фото, выбрать фотографию)
  func didTapImagePicker() {
    let actionSheet = UIAlertController(title: "Profile Picture",
                                        message: "How would you like to select a picture?",
                                        preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "Cancel",
                                        style: .cancel,
                                        handler: nil))
    actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                        style: .default,
                                        handler: { [weak self] _ in
      self?.presentCamera()
    }))
    actionSheet.addAction(UIAlertAction(title: "Chose Photo",
                                        style: .default,
                                        handler: { [weak self] _ in
      self?.presentPhotoPicker()
    }))
    
    present(actionSheet, animated: true)
    
  }
  
  func presentCamera() {
    let vc = UIImagePickerController()
    vc.sourceType = .camera
    vc.delegate = self
    vc.allowsEditing = true
    present(vc, animated: true)
  }
  
  func presentPhotoPicker() {
    let vc = UIImagePickerController()
    vc.sourceType = .photoLibrary
    vc.delegate = self
    vc.allowsEditing = true
    present(vc, animated: true)
  }
  
  
  // вызывается когда пользователь делает фотографию или выбирает фото
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true, completion: nil)
    guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage]
            as? UIImage else { return }
    self.userView.profileImageView.image = selectedImage
  }
  
  // вызывается когда пользователь отменяет съемку или выбор фотографии
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  // метод UserViewDelegate: вызывает TextField
  func didTapEditName() {
    userView.nameField.becomeFirstResponder()
  }
  
  // метод UserViewDelegate: переход на следующий ВК
  func didTapNextVC() {
    let mainVC = MainViewController()
    //    mainVC.title = "Mark Test Task"
    mainVC.modalPresentationStyle = .fullScreen
    mainVC.modalTransitionStyle = .crossDissolve
    self.present(mainVC, animated: true, completion: nil)
  }
  
  // метод UserViewDelegate: проверяет и сохраняет
  func didTapSaveButton() {
    userView.nameField.resignFirstResponder()
    guard let name = userView.nameField.text, let picture = userView.profileImageView.image, !name.isEmpty  else {
      alertUserNameError()
      return
    }
      // UserDefault saves name and pictures
      
      didTapNextVC()
    
  }
  
  // алёрт на случай, если юзер не указал свое имя
  func alertUserNameError() {
    let alert = UIAlertController(title: "Warning", message: "Pleas enter your name", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    present(alert, animated: true)
  }
  
  
}

// MARK: - UITextFieldDelegate

extension UserViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    userView.nameField.resignFirstResponder()
    return true
  }
}
