//
//  ViewController.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private var servicesCollectionView: UICollectionView!
    
    // MARK: - Properties (data)
    
    // fill service with dummy data until networking is integrated
    private var allServices: [Service] = [
        Service(imageURL: "https://static.vecteezy.com/system/resources/previews/005/988/959/original/calendar-icon-free-vector.jpg", name: "Calendar", popularity: "4.5", cost: 3, amountUsed: 8, frequencyOfUse: "Monthly"),
        Service(imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", popularity: "4.9", cost: 1, amountUsed: 17, frequencyOfUse: "Daily")
    ]
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App Name"
        view.backgroundColor = UIColor.white
        
        setUpServicesCollectionView()
        
    }
    
    // MARK: - Set Up Views
    
    private func setUpServicesCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        
        servicesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        servicesCollectionView.backgroundColor = UIColor.white
        servicesCollectionView.alwaysBounceVertical = true
        
        servicesCollectionView.register(ServicesCollectionViewCell.self, forCellWithReuseIdentifier: ServicesCollectionViewCell.reuse)
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
        view.addSubview(servicesCollectionView)
        
        servicesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    // MARK: - Networking
    
    
}

// MARK: - Delegation

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.reuse, for: indexPath) as! ServicesCollectionViewCell
        let service = allServices[indexPath.item]
        cell.configure(with: service)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allServices.count
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 184)
    }
}

