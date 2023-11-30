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
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setUpProfilePictureImageView()
        setUpUsernameLabel()
        setUpUserIdLabel()
        setUpUserIdLabel()
        setUpNumberOfServicesUsedLabel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    
    private func setUpProfilePictureImageView() {
        profilePictureImageView.image = UIImage(systemName: "person")
        profilePictureImageView.layer.cornerRadius = 48
        profilePictureImageView.layer.masksToBounds = true
        view.addSubview(profilePictureImageView)
        
        profilePictureImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.width.height.equalTo(96)
        }
    }
    
    private func setUpUsernameLabel() {
        // configure usernameLabel's text here
        usernameLabel.text = "username"
        usernameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        usernameLabel.textColor = UIColor.black
        view.addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(55)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    private func setUpUserIdLabel() {
        // configure userIdLabel's text here
        userIdLabel.text = "user ID"
        userIdLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        userIdLabel.textColor = UIColor.black
        view.addSubview(userIdLabel)
        
        userIdLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    private func setUpNumberOfServicesUsedLabel() {
        // configure numberOfServicesUsedLabel's text here
        numberOfServicesUsedLabel.text = "number of services used"
        numberOfServicesUsedLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        numberOfServicesUsedLabel.textColor = UIColor.black
        view.addSubview(numberOfServicesUsedLabel)
        
        numberOfServicesUsedLabel.snp.makeConstraints { make in
            make.top.equalTo(userIdLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    
}
