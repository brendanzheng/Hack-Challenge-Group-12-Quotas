//
//  DescriptionViewController.swift
//  iOS Project
//
//  Created by William Liu on 11/30/23.
//

import UIKit
import SnapKit
import SDWebImage

class DescriptionViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let serviceNameLabel = UILabel()
    private let serviceDescriptionLabel = UILabel()
    private let serviceCostLabel = UILabel()
    private let useServiceButton = UIButton()
    private let imageURL = UIImageView()
    
    // MARK: - Properties (data)
    
    private var service: Service!
    private var user: User!
    private weak var delegate: DescriptionViewControllerDelegate?
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.aFinal.silver
        
        setUpServiceNameLabel()
        setUpServiceDescriptionLabel()
        setUpServiceCostLabel()
        setUpUseServiceButton()
        setUpImageURL()
    }
    
    init(user: User, service: Service, delegate: DescriptionViewControllerDelegate) {
        self.user = user
        self.service = service
        self.delegate = delegate
        
        serviceNameLabel.text = service.getName()
        serviceDescriptionLabel.text = service.getDescription()
        serviceCostLabel.text = "Quota Cost: \(service.getCost())"
        imageURL.sd_setImage(with: URL(string: service.getImageURL()))
        
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
    
    private func setUpImageURL() {
        imageURL.layer.cornerRadius = 32 / 2
        imageURL.layer.masksToBounds = true
        imageURL.clipsToBounds = true
        view.addSubview(imageURL)
        
        imageURL.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
                make.trailing.equalToSuperview().offset(-20)
                make.width.height.equalTo(150)
        }
    }
    
    private func setUpUseServiceButton() {
        useServiceButton.backgroundColor = UIColor(red: 255/255, green: 127/255, blue: 80/255, alpha: 1.0)
        useServiceButton.layer.cornerRadius = 8
        useServiceButton.setTitle("Use Service", for: .normal)
        useServiceButton.setTitleColor(UIColor.white, for: .normal)
        useServiceButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        useServiceButton.layer.shadowColor = UIColor.black.cgColor
        useServiceButton.layer.shadowOpacity = 0.3
        useServiceButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        useServiceButton.layer.shadowRadius = 2
        
        useServiceButton.layer.borderWidth = 1
        useServiceButton.layer.borderColor = UIColor.aFinal.yellowOrange.cgColor
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.5
        pulseAnimation.fromValue = 0.95
        pulseAnimation.toValue = 1.0
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = Float.infinity
        useServiceButton.layer.add(pulseAnimation, forKey: "pulse")
        useServiceButton.addTarget(self, action: #selector(useServiceButtonPressed), for: .touchUpInside)
        view.addSubview(useServiceButton)
        
        useServiceButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
       
    }
    
    // MARK: - Button Helpers
    
    @objc private func useServiceButtonPressed() {
        
        NetworkManager.shared.decreaseQuotaCost(service: service, user: user) { [weak self] user in
            guard let self = self else { return }
            self.delegate?.updateQuotas(user: user)
            
            DispatchQueue.main.async {
                let justUsedServiceViewController = JustUsedServiceViewController()
                self.navigationController?.pushViewController(justUsedServiceViewController, animated: true)
            }
        }
    }
    
}

// MARK: - Delegation

protocol DescriptionViewControllerDelegate: AnyObject {
    func updateQuotas(user: User)
}

