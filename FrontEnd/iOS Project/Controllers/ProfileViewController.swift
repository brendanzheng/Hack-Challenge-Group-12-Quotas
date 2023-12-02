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
    private let usernameTextField = UITextField()
    private let userIdTextField = UITextField()
    private let quotasLeftLabel = UILabel()
    private let quotasLeftTextField = UITextField()
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
        setUpUsernameTextField()
        setUpUserIdLabel()
        setUpUserIdTextField()
        setUpQuotasLeftLabel()
        setUpQuotasLeftTextField()
        setUpServicesUsedButton()
        setUpDeleteAccountButton()
    }

    init(user: User) {
        
        self.user = user
        usernameTextField.placeholder = user.getUsername()
        userIdTextField.placeholder = "\(user.getId())"
        quotasLeftTextField.placeholder = "\(user.getQuotasLeft())"
        
        let profilePictureURL = user.getProfilePicture()
        if !profilePictureURL.isEmpty {
            profilePictureImageView.sd_setImage(with: URL(string: profilePictureURL))
        } else {
            profilePictureImageView.image = UIImage(systemName: "person")
        }
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set Up Views

    private func setUpProfilePictureImageView() {
        profilePictureImageView.tintColor = .systemBackground
        profilePictureImageView.layer.cornerRadius = 48
        profilePictureImageView.layer.masksToBounds = true
        view.addSubview(profilePictureImageView)

        profilePictureImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.width.equalTo(250)
            make.height.equalTo(260)
        }
    }

    private func setUpUsernameLabel() {
        usernameLabel.text = "Username"
        usernameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        usernameLabel.textColor = UIColor.black
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }

    private func setUpUsernameTextField() {
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemBackground.cgColor
        usernameTextField.layer.cornerRadius = 12
        usernameTextField.textAlignment = .center
        usernameTextField.textColor = .darkGray
        usernameTextField.font = .systemFont(ofSize: 30)
        usernameTextField.isUserInteractionEnabled = false
        view.addSubview(usernameTextField)

        usernameTextField.snp.makeConstraints { make in
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
            make.top.equalTo(usernameTextField.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
        
    private func setUpUserIdTextField() {
        userIdTextField.layer.borderWidth = 1
        userIdTextField.layer.borderColor = UIColor.systemBackground.cgColor
        userIdTextField.layer.cornerRadius = 12
        userIdTextField.textAlignment = .center
        userIdTextField.textColor = .darkGray
        userIdTextField.font = .systemFont(ofSize: 30)
        userIdTextField.isUserInteractionEnabled = false
        view.addSubview(userIdTextField)

        userIdTextField.snp.makeConstraints { make in
            make.top.equalTo(userIdLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    private func setUpQuotasLeftLabel() {
        quotasLeftLabel.text = "Quotas Left"
        quotasLeftLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        quotasLeftLabel.textColor = UIColor.black
        quotasLeftLabel.textAlignment = .center
        view.addSubview(quotasLeftLabel)

        quotasLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(userIdTextField.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    private func setUpQuotasLeftTextField() {
        quotasLeftTextField.layer.borderWidth = 1
        quotasLeftTextField.layer.borderColor = UIColor.systemBackground.cgColor
        quotasLeftTextField.layer.cornerRadius = 12
        quotasLeftTextField.textAlignment = .center
        quotasLeftTextField.textColor = .darkGray
        quotasLeftTextField.font = .systemFont(ofSize: 30)
        quotasLeftTextField.isUserInteractionEnabled = false
        view.addSubview(quotasLeftTextField)

        quotasLeftTextField.snp.makeConstraints { make in
            make.top.equalTo(quotasLeftLabel.snp.bottom).offset(8)
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
            make.top.equalTo(quotasLeftTextField.snp.bottom).offset(10)
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
        let userServicesViewController = UserServicesViewController(user: user)
        navigationController?.pushViewController(userServicesViewController, animated: true)
    }
    
    @objc private func pushDeleteAccountViewController() {
        let deleteUserViewController = DeleteUserViewController(user: user, delegate: self)
        navigationController?.pushViewController(deleteUserViewController, animated: true)
    }
    
}

// MARK: - Delegation

extension ProfileViewController: DeleteUserDelegate {
    func userDeletedAccount() {
        self.user = User()
        updateProfileViewController()
    }
    
    private func updateProfileViewController() {
        
        usernameTextField.placeholder = self.user.getUsername()
        userIdTextField.placeholder = "\(self.user.getId())"
        quotasLeftTextField.placeholder = "\(self.user.getQuotasLeft())"
        profilePictureImageView.image = UIImage(systemName: "person")
    }
    
}
