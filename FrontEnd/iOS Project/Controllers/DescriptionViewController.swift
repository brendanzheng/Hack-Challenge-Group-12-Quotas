//
//  DescriptionViewController.swift
//  iOS Project
//
//  Created by William Liu on 11/30/23.
//

import UIKit
import SnapKit

class DescriptionViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let serviceNameLabel = UILabel()
    private let serviceDescriptionLabel = UILabel()
    private let serviceCostLabel = UILabel()
    private let useServiceButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var service: Service!
    private var user: User!
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setUpServiceNameLabel()
        setUpServiceDescriptionLabel()
        setUpServiceCostLabel()
        setUpUseServiceButton()
    }
    
    init(with service: Service) {
        self.service = service
        
        serviceNameLabel.text = service.getName()
        serviceDescriptionLabel.text = service.getDescription()
        serviceCostLabel.text = "Quota Cost: \(service.getCost())"
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    
    private func setUpServiceNameLabel() {
        serviceNameLabel.textColor = UIColor.black
        serviceNameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        view.addSubview(serviceNameLabel)
        
        serviceNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpServiceDescriptionLabel() {
        serviceDescriptionLabel.textColor = UIColor.black
        serviceDescriptionLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        serviceDescriptionLabel.numberOfLines = 0
        view.addSubview(serviceDescriptionLabel)
        
        serviceDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceNameLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpServiceCostLabel() {
        serviceCostLabel.textColor = UIColor.black
        serviceCostLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        view.addSubview(serviceCostLabel)
        
        serviceCostLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceDescriptionLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpUseServiceButton() {
        useServiceButton.backgroundColor = UIColor.aFinal.ruby
        useServiceButton.layer.cornerRadius = 4
        useServiceButton.setTitle("Use Service", for: .normal)
        useServiceButton.setTitleColor(UIColor.black, for: .normal)
        useServiceButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        useServiceButton.addTarget(self, action: #selector(serviceButtonPressed), for: .touchUpInside)
        view.addSubview(useServiceButton)
        
        useServiceButton.snp.makeConstraints { make in
            make.top.equalTo(serviceCostLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
    }
    
    // MARK: - Button Helpers
    
    @objc private func serviceButtonPressed() {
        
        // this function decreases the amount of quotas the user has
        // should be implemented through the use of networking
        // pseudocode: user.getQuotasLeft() - 1
    }
}
