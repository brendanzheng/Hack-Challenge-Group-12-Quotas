//
//  JustUsedServiceViewController.swift
//  iOS Project
//
//  Created by William Liu on 12/1/23.
//

import UIKit

class JustUsedServiceViewController: UIViewController {
    
    
    // MARK: - Properties (view)
    
    private let contactSymbol = UIImageView()
    private let contactLabel = UILabel()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setUpContactLabel()


    }
    
    // MARK: - Set Up Views
    

    
    private func setUpContactLabel() {
        contactLabel.text = "Someone will contact you to provide more information."
        contactLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        contactLabel.textColor = UIColor.black
        contactLabel.textAlignment = .center
        contactLabel.numberOfLines = 0
        view.addSubview(contactLabel)
        
        contactLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(50)
            make.centerY.equalToSuperview().offset(-50)
           
        }
    }

    
}
