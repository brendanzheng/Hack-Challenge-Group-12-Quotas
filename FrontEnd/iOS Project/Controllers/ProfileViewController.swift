//
//  ProfileViewController.swift
//  iOS Project
//
//  Created by William Liu on 11/28/23.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    
    // MARK: - Properties (view)
    
    private let profilePictureImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let userIdLabel = UILabel()
    private let numberOfServicesUsedLabel = UILabel()
    private let usernametextfield = UITextField ()
    private let userIdtextfield = UITextField ()
    private let servicestextfield = UITextField ()
    
    
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        view.backgroundColor = UIColor.aFinal.silver/*UIColor(red: 245/255, green: 245/255, blue: 250/255, alpha: 1.0)*/
        

        setUpProfilePictureImageView()
        setUpUsernameLabel()
        setUpUserIdLabel()
        setUpUserIdLabel()
        setUpNumberOfServicesUsedLabel()
        setUpUsernametextfield()
        setUpUserIdtextfield()
        setUpservicestextfield()
        }

        init() {
        super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Set Up Views

        private func setUpProfilePictureImageView() {
        profilePictureImageView.image = UIImage(systemName: "person")?.withRenderingMode(.alwaysTemplate)
        profilePictureImageView.tintColor = .systemBackground
        profilePictureImageView.layer.cornerRadius = 48
        profilePictureImageView.layer.masksToBounds = true
        view.addSubview(profilePictureImageView)

        profilePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.width.height.equalTo(200)
        }
        }

        private func setUpUsernameLabel() {
        // configure usernameLabel's text here
        usernameLabel.text = "Username"
        usernameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        usernameLabel.textColor = UIColor.black
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(55)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        }

        private func setUpUsernametextfield() {
        //        usernametextfield.placeholder = "Edit Username"
        usernametextfield.layer.borderWidth = 1
        usernametextfield.layer.borderColor = UIColor.systemBackground.cgColor
        usernametextfield.layer.cornerRadius = 12
        usernametextfield.textAlignment = .center
        usernametextfield.textColor = .darkGray
        usernametextfield.font = .systemFont(ofSize: 16)
        view.addSubview(usernametextfield)

        usernametextfield.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        }
        //

        private func setUpUserIdLabel() {
        // configure userIdLabel's text here
        userIdLabel.text = "User ID"
        userIdLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        userIdLabel.textColor = UIColor.black
        userIdLabel.textAlignment = .center
        view.addSubview(userIdLabel)

        userIdLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(142)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        }
        private func setUpUserIdtextfield() {
        //        userIdtextfield.placeholder = "Edit User ID"
        userIdtextfield.layer.borderWidth = 1
        userIdtextfield.layer.borderColor = UIColor.systemBackground.cgColor
        userIdtextfield.layer.cornerRadius = 12
        userIdtextfield.textAlignment = .center
        userIdtextfield.textColor = .darkGray
        userIdtextfield.font = .systemFont(ofSize: 16)
        view.addSubview(userIdtextfield)

        userIdtextfield.snp.makeConstraints { make in
            make.top.equalTo(userIdLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        }

        private func setUpNumberOfServicesUsedLabel() {
        // configure numberOfServicesUsedLabel's text here
        numberOfServicesUsedLabel.text = "Services Used"
        numberOfServicesUsedLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        numberOfServicesUsedLabel.textColor = UIColor.black
        numberOfServicesUsedLabel.textAlignment = .center
        view.addSubview(numberOfServicesUsedLabel)

        numberOfServicesUsedLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(229)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        }
        private func setUpservicestextfield() {
        //        servicestextfield.placeholder = "Edit User ID"
        servicestextfield.layer.borderWidth = 1
        servicestextfield.layer.borderColor = UIColor.systemBackground.cgColor
        servicestextfield.layer.cornerRadius = 12
        servicestextfield.textAlignment = .center
        servicestextfield.textColor = .darkGray
        servicestextfield.font = .systemFont(ofSize: 16)
        view.addSubview(servicestextfield)

        servicestextfield.snp.makeConstraints { make in
            make.top.equalTo(numberOfServicesUsedLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        }


        }
