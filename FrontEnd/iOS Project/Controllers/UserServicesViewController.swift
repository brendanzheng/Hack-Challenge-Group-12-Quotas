//
//  UserServicesViewController.swift
//  iOS Project
//
//  Created by William Liu on 12/1/23.
//

import UIKit
import SnapKit

class UserServicesViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private var servicesHistoryCollectionView: UICollectionView!
    
    // MARK: - Properties (data)
    
    private var servicesUsed: [Service]!
    private var user: User!
    
    // MARK: viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        setUpServicesHistoryCollectionView()
        
    }
    
    init(user: User) {
        self.user = user
        self.servicesUsed = user.getServices()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set Up Views
    
    private func setUpServicesHistoryCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        
        servicesHistoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        servicesHistoryCollectionView.backgroundColor = UIColor.white
        servicesHistoryCollectionView.alwaysBounceVertical = true
        
        servicesHistoryCollectionView.register(ServicesCollectionViewCell.self, forCellWithReuseIdentifier: ServicesCollectionViewCell.reuse)
        servicesHistoryCollectionView.dataSource = self
        servicesHistoryCollectionView.delegate = self
        view.addSubview(servicesHistoryCollectionView)
        
        servicesHistoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }

}

// MARK: UICollectionViewDelegate

extension UserServicesViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDataSource

extension UserServicesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.reuse, for: indexPath) as! ServicesCollectionViewCell
        let service = servicesUsed[indexPath.item]
        cell.configure(with: service)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicesUsed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension UserServicesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 184)
    }
}


