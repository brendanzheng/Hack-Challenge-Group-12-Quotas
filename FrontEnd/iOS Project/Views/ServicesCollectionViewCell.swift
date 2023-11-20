//
//  ServicesCollectionViewCell.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import UIKit
import SDWebImage
import SnapKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    
    private let serviceImage = UIImageView()
    private let nameOfServiceLabel = UILabel()
    private let popularityImageIcon = UIImageView()
    private let popularityLabel = UILabel()
    private let quotaCostImageIcon = UIImageView()
    private let quotaCostLabel = UILabel()
    private let amountUsedLabel = UILabel()
    private let frequencyOfUseLabel = UILabel()
    
    // MARK: - Properties (data)
    
    private var service: Service!
    static let reuse = "ServicesCollectionViewCellReuse"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.systemCyan
        layer.cornerRadius = 16
        
        setUpServiceImage()
        setUpNameOfService()
        setUpPopularityImageIcon()
        setUpPopularityLabel()
        setUpQuotaCostImageIcon()
        setUpQuotaCost()
        setUpFrequencyOfUseLabel()
        setUpAmountUsedLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(with service: Service) {
        
        self.service = service
        
        serviceImage.sd_setImage(with: URL(string: service.getImageURL()))
        nameOfServiceLabel.text = service.getName()
        popularityLabel.text = service.getPopularity()
        quotaCostLabel.text = "\(service.getCost())"
        frequencyOfUseLabel.text = "Frequency of Use: \(service.getFrequencyOfUse())"
        amountUsedLabel.text = "Number of Times Used: \(service.getAmountUsed())"
        
    }
    
    // MARK: - Set Up Views
    
    private func setUpServiceImage() {
        serviceImage.layer.cornerRadius = 12
        serviceImage.layer.masksToBounds = true
        contentView.addSubview(serviceImage)
        
        serviceImage.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(contentView.snp.trailing).offset(-100)
            make.size.equalTo(50)
        }
    }
    
    private func setUpNameOfService() {
        nameOfServiceLabel.textColor = UIColor.black
        nameOfServiceLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameOfServiceLabel.numberOfLines = 2
        contentView.addSubview(nameOfServiceLabel)
        
        nameOfServiceLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12)
            make.trailing.equalTo(serviceImage.snp.leading)
        }
    }
    
    private func setUpPopularityImageIcon() {
        popularityImageIcon.sd_setImage(with: URL(string: "https://icons.veryicon.com/png/o/miscellaneous/linear-icon-14/popular-11.png"))
        popularityImageIcon.tintColor = UIColor.black
        popularityImageIcon.layer.cornerRadius = 12
        popularityImageIcon.layer.masksToBounds = true
        contentView.addSubview(popularityImageIcon)
        
        popularityImageIcon.snp.makeConstraints { make in
            make.top.equalTo(nameOfServiceLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.size.equalTo(24)
        }
    }
    
    private func setUpPopularityLabel() {
        popularityLabel.textColor = UIColor.yellow
        popularityLabel.font = .systemFont(ofSize: 15, weight: .regular)
        popularityLabel.numberOfLines = 1
        contentView.addSubview(popularityLabel)
        
        popularityLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOfServiceLabel.snp.bottom).offset(12)
            make.leading.equalTo(popularityImageIcon.snp.trailing).offset(12)
            make.trailing.equalTo(serviceImage.snp.leading)
        }
    }
    
    private func setUpQuotaCostImageIcon() {
        quotaCostImageIcon.sd_setImage(with: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4e0MeqXRI3zse1gg7PyLj5sU-quoEwc9jkA&usqp=CAU"))
        quotaCostImageIcon.tintColor = UIColor.black
        quotaCostImageIcon.layer.cornerRadius = 12
        quotaCostImageIcon.layer.masksToBounds = true
        contentView.addSubview(quotaCostImageIcon)
        
        quotaCostImageIcon.snp.makeConstraints { make in
            make.top.equalTo(popularityImageIcon.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.size.equalTo(24)
        }
    }
    
    private func setUpQuotaCost() {
        quotaCostLabel.textColor = UIColor.red
        quotaCostLabel.font = .systemFont(ofSize: 15, weight: .regular)
        quotaCostLabel.numberOfLines = 1
        contentView.addSubview(quotaCostLabel)
        
        quotaCostLabel.snp.makeConstraints { make in
            make.top.equalTo(popularityLabel.snp.bottom).offset(12)
            make.leading.equalTo(quotaCostImageIcon.snp.trailing).offset(12)
            make.trailing.equalTo(serviceImage.snp.leading)
        }
    }
    
    private func setUpAmountUsedLabel() {
        amountUsedLabel.textColor = UIColor.black
        amountUsedLabel.font = .systemFont(ofSize: 12, weight: .regular)
        amountUsedLabel.numberOfLines = 1
        contentView.addSubview(amountUsedLabel)
        
        amountUsedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalTo(frequencyOfUseLabel.snp.top).offset(-4)
            make.trailing.equalTo(serviceImage.snp.leading)
        }
    }
    
    private func setUpFrequencyOfUseLabel() {
        frequencyOfUseLabel.textColor = UIColor.black
        frequencyOfUseLabel.font = .systemFont(ofSize: 12, weight: .regular)
        frequencyOfUseLabel.numberOfLines = 1
        contentView.addSubview(frequencyOfUseLabel)
        
        frequencyOfUseLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.trailing.equalTo(serviceImage.snp.leading)
        }
    }
    
}
