//
//  DeleteUserViewController.swift
//  iOS Project
//
//  Created by William Liu on 12/1/23.
//

import UIKit
import SnapKit

class DeleteUserViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let questionLabel = UILabel()
    private let yesButton = UIButton()
    private let noButton = UIButton()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.aFinal.silver
        navigationController?.navigationBar.barTintColor = UIColor.aFinal.silver
        
        setUpQuestionLabel()
        setUpYesButton()
        setUpNoButton()
    }
    
    // MARK: - Set Up Views
    
    private func setUpQuestionLabel() {
        questionLabel.text = "Are you sure you want to delete this account? (This action can't be reversed and all data will be lost.)"
        questionLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        questionLabel.textColor = UIColor.black
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
    }
    
    private func setUpYesButton() {
        yesButton.backgroundColor = UIColor.red
        yesButton.layer.cornerRadius = 16
        yesButton.setTitle("Yes", for: .normal)
        yesButton.setTitleColor(UIColor.black, for: .normal)
        yesButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
//        yesButton.addTarget(self, action: T##Selector, for: .touchUpInside)
        view.addSubview(yesButton)
        
        yesButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(90)
            make.top.equalTo(questionLabel.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    private func setUpNoButton() {
        noButton.backgroundColor = UIColor.green
        noButton.layer.cornerRadius = 16
        noButton.setTitle("No", for: .normal)
        noButton.setTitleColor(UIColor.black, for: .normal)
        noButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        noButton.addTarget(self, action: #selector(popDeleteUserViewController), for: .touchUpInside)
        view.addSubview(noButton)
        
        noButton.snp.makeConstraints { make in
            make.leading.equalTo(yesButton.snp.trailing).offset(20)
            make.top.equalTo(questionLabel.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    // MARK: - Button Helpers
    
    @objc private func popDeleteUserViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Networking
    // implement delete user logic here
    
}
