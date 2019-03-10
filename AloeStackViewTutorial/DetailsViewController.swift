//
//  ViewController.swift
//  AloeStackViewTutorial
//
//  Created by Grace Njoroge on 10/03/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit
import AloeStackView

class DetailsViewController: AloeStackViewController {
  
  var spotNameTF: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    tf.attributedPlaceholder = NSAttributedString(string: "Name for spot", attributes: attributes)
    tf.textColor = .white
    return tf
  }()
  
  var spotineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()
  
  var locationLabel: UILabel = {
    let label = UILabel()
    label.text = "Location"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var indoorButton: UIButton = {
    let button = UIButton()
    button.setTitle("indoor", for: .normal)
    button.isSelected = true
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.white.cgColor
    button.addTarget(self, action: #selector(setButtonsUI), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var outdoorButton: UIButton = {
    let button =  UIButton()
    button.setTitle("outdoor", for: .normal)
    button.addTarget(self, action: #selector(setButtonsUI), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var buttonsStackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.spacing = 5
    stack.distribution = .fillEqually
    return stack
  }()
  
  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Description"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    return label
  }()
  
  var textView: UITextView = {
    let textview = UITextView()
    textview.isScrollEnabled = false
    textview.textColor = .white
    textview.translatesAutoresizingMaskIntoConstraints = false
    textview.isEditable = true
    textview.font = UIFont.systemFont(ofSize: 14)
    textview.backgroundColor = .clear
    textview.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    return textview
  }()
  
  var descriptionLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lightGray
    return view
  }()
  
  var policeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Police"
    label.textColor = .lightGray
    return label
  }()
  
  var policeImageView: UIImageView = {
    let img = UIImageView()
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    img.image = UIImage(named: "badge")?.withRenderingMode(.alwaysOriginal)
    return img
  }()
  
  var inhabitantsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Inhabitants"
    label.textColor = .lightGray
    return label
  }()
  
  var inhabitantsImageView: UIImageView = {
    let img = UIImageView()
    img.translatesAutoresizingMaskIntoConstraints = false
    img.contentMode = .scaleAspectFit
    img.image = UIImage(named: "pple")?.withRenderingMode(.alwaysOriginal)
    return img
  }()
  
  var tickButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .black
    button.setImage(UIImage(named: "checkMark")?.withRenderingMode(.alwaysOriginal), for: .normal)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
   
    //setting up navigation controller
    setUpNavigationBarView()
    
    //setup UI constraints
    setUpSpotTextField()
    setupLocationView()
    setupDescriptionView()
    setupPoliceAndInhabitantsView()
    setupTickButton()
  }
  
  func setUpNavigationBarView() {
    navigationController?.navigationBar.barTintColor = .black
    navigationController?.navigationBar.isTranslucent = false
    navigationItem.title = "Spot Info"
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  func setUpSpotTextField() {
    stackView.hidesSeparatorsByDefault = true
    stackView.setInset(forRows: stackView.getAllRows(), inset: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: -24))
    stackView.addRow(spotNameTF)
    stackView.addRow(spotineView)
    spotineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
  }
  
  func setupLocationView() {
    stackView.addRow(locationLabel)
    indoorButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    outdoorButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    buttonsStackView.addArrangedSubview(indoorButton)
    buttonsStackView.addArrangedSubview(outdoorButton)
    stackView.addRow(buttonsStackView)
  }
  
  @objc func setButtonsUI(sender: UIButton) {
    
    switch sender {
    case indoorButton:
      indoorButton.layer.cornerRadius = 20
      indoorButton.layer.borderWidth = 2.0
      outdoorButton.layer.borderWidth = 0
      indoorButton.isSelected = true
      outdoorButton.isSpringLoaded = false
    case outdoorButton:
      outdoorButton.layer.cornerRadius = 20
      outdoorButton.layer.borderWidth = 2.0
      indoorButton.layer.borderWidth = 0
      outdoorButton.layer.borderColor = UIColor.white.cgColor
      outdoorButton.isSelected = true
      indoorButton.isSelected = true
    default:
      break
    }
    
  }
  
  func setupDescriptionView() {
    stackView.addRow(descriptionLabel)
    stackView.addRow(textView)
    stackView.addRow(descriptionLineView)
    descriptionLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
  }
  
  func setupPoliceAndInhabitantsView() {
    
    stackView.addRow(policeLabel)
    stackView.addRow(policeImageView)
    
    stackView.addRow(inhabitantsLabel)
    stackView.addRow(inhabitantsImageView)
  
  }
  
  func setupTickButton() {
    stackView.addRow(tickButton)
    tickButton.heightAnchor.constraint(equalToConstant: 72).isActive = true
  }


}

