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
    
    private var servicesUsed: [Service] = [
        Service(serviceId: 1, imageURL: "https://static.vecteezy.com/system/resources/previews/005/988/959/original/calendar-icon-free-vector.jpg", name: "Calendar", description: "designed to keep a calendar of all of your events", popularity: "4.5", cost: 3),
        Service(serviceId: 2, imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", description: "keeps a running list of all your tasks", popularity: "4.9", cost: 1),
        Service(serviceId: 3, imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", description: "keeps a running list of all your tasks", popularity: "4.8", cost: 3),
        Service(serviceId: 4, imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", description: "keeps a running list of all your tasks", popularity: "1.0", cost: 5),
        Service(serviceId: 5, imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", description: "keeps a running list of all your tasks", popularity: "4.9", cost: 1),
        Service(serviceId: 6, imageURL: "https://png.pngtree.com/png-vector/20190628/ourmid/pngtree-task-icon-for-your-project-png-image_1520262.jpg", name: "Tasks", description: "keeps a running list of all your tasks", popularity: "3.0", cost: 2)
    ]
    private var user: User!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        view.backgroundColor = UIColor.aFinal.silver
        navigationController?.navigationBar.barTintColor = UIColor.aFinal.silver
        
        setUpServicesHistoryCollectionView()
        
    }
    
    // MARK: Set Up Views
    
    private func setUpServicesHistoryCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        
        servicesHistoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        servicesHistoryCollectionView.backgroundColor = UIColor.aFinal.silver
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
    
    // MARK: Networking
    
    // fetch the services that the user used through backend
    // fetch user and then the services inside the user's JSON list

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


