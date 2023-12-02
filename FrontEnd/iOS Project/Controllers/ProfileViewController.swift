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
    private let usernametextfield = UITextField()
    private let userIdtextfield = UITextField()
    private let servicesUsedButton = UIButton()
    private let deleteAccountButton = UIButton()
    
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = UIColor.aFinal.silver
        

        setUpProfilePictureImageView()
        setUpUsernameLabel()
        setUpUserIdLabel()
        setUpUserIdLabel()
        setUpUsernametextfield()
        setUpUserIdtextfield()
        setUpServicesUsedButton()
        setUpDeleteAccountButton()
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
        // configure user's username from backend integration
        // for now we will just use the following
        // usernametextfield.placeholder = "Edit Username"
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

    private func setUpUserIdLabel() {
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
        // configure user's user ID from backend integration
        // userIdtextfield.placeholder = "Edit User ID"
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
    
    private func setUpServicesUsedButton() {
        servicesUsedButton.backgroundColor = UIColor.orange
        servicesUsedButton.layer.cornerRadius = 25
        servicesUsedButton.setTitle("Used Services", for: .normal)
        servicesUsedButton.setTitleColor(UIColor.black, for: .normal)
        servicesUsedButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        servicesUsedButton.addTarget(self, action: #selector(pushUserServicesHistory), for: .touchUpInside)
        view.addSubview(servicesUsedButton)
        
        servicesUsedButton.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(250)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    private func setUpDeleteAccountButton() {
        deleteAccountButton.backgroundColor = UIColor.red
        deleteAccountButton.layer.cornerRadius = 25
        deleteAccountButton.setTitle("Delete Account", for: .normal)
        deleteAccountButton.setTitleColor(UIColor.black, for: .normal)
        deleteAccountButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        deleteAccountButton.addTarget(self, action: #selector(pushDeleteAccountViewController), for: .touchUpInside)
        view.addSubview(deleteAccountButton)
        
        deleteAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Button Helpers
    
    @objc private func pushUserServicesHistory() {
        let userServicesViewController = UserServicesViewController()
        navigationController?.pushViewController(userServicesViewController, animated: true)
    }
    
    @objc private func pushDeleteAccountViewController() {
        let deleteUserViewController = DeleteUserViewController()
        navigationController?.pushViewController(deleteUserViewController, animated: true)
    }
    

}
