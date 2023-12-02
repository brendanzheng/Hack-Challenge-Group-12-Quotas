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
    private var filterBarCollectionView: UICollectionView!
    private let profileButton = UIButton()
    private let searchBar = UISearchBar()
    
    // MARK: - Properties (data)
    
    private var allServices: [Service] = []
    private var selectedServices: [Service] = []
    private var favoriteServices: [Service] = []
    
    private var serviceNames: [String] = []
    private var namesOfFavoriteServices: [String] = []
    
    private var filters: [String] = ["All", "Most Popular", "Lowest Cost", "Least Popular"]
    private var selectedFilter: String = "All"
    
    private var user: User!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App Name"
        view.backgroundColor = UIColor.aFinal.silver
        navigationController?.navigationBar.barTintColor = UIColor.aFinal.silver
        
        setUpServicesCollectionView()
        setUpSearchBar()
        setUpFilterBarCollectionView()
        setUpProfileButton()
        fetchAllServices()
        filterServices()
        fetchUser()
    }
    
    // MARK: - Set Up Views
    
    private func setUpServicesCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        
        servicesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        servicesCollectionView.backgroundColor = UIColor.aFinal.silver
        servicesCollectionView.alwaysBounceVertical = true
        
        servicesCollectionView.register(ServicesCollectionViewCell.self, forCellWithReuseIdentifier: ServicesCollectionViewCell.reuse)
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
        view.addSubview(servicesCollectionView)
        
        servicesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
    }
    
    private func setUpFilterBarCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        
        filterBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filterBarCollectionView.backgroundColor = UIColor.aFinal.silver
        filterBarCollectionView.showsHorizontalScrollIndicator = false
        
        filterBarCollectionView.register(FilterBarCollectionViewCell.self, forCellWithReuseIdentifier: FilterBarCollectionViewCell.reuse)
        
        filterBarCollectionView.dataSource = self
        filterBarCollectionView.delegate = self
        
        view.addSubview(filterBarCollectionView)
        
        filterBarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
    }
    
    private func setUpSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.aFinal.silver
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.white
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
        }
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
    }
    
    // MARK: - Networking
    
    @objc private func fetchAllServices() {
        NetworkManager.shared.fetchAllServices { [weak self] services in
            guard let self = self else { return }
            self.allServices = services
            self.selectedServices = services
            
            DispatchQueue.main.async {
                self.servicesCollectionView.reloadData()
            }
        }
    }
    
    @objc private func fetchUser() {
        NetworkManager.shared.fetchUser { [weak self] user in
            guard let self = self else { return }
            self.user = user
            
            DispatchQueue.main.async {
                self.servicesCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - CollectionView Helpers
    
    private func filterServices() {
        namesOfFavoriteServices = favoriteServices.map { $0.getName() }
        
        if selectedFilter == "All" {
            selectedServices = allServices
        }
        else if selectedFilter == "Favorites" {
            selectedServices = favoriteServices
        }
        else if selectedFilter == "Most Popular" {
            selectedServices = allServices.filter { $0.getPopularity() >= 9.0 }
        }
        else if selectedFilter == "Lowest Cost" {
            selectedServices = allServices.filter { $0.getCost() <= 1 }
        }
        else if selectedFilter == "Least Popular" {
            selectedServices = allServices.filter { $0.getPopularity() <= 2 }
        }
        servicesCollectionView.reloadData()
    }
    
    // MARK: - Button Helpers
    
    private func setUpProfileButton() {
        profileButton.setImage(UIImage(systemName: "person"), for: .normal)
        profileButton.layer.cornerRadius = 10
        profileButton.tintColor = UIColor.black
        profileButton.backgroundColor = UIColor.aFinal.silver
        profileButton.addTarget(self, action: #selector(pushProfilePage), for: .touchUpInside)
        
        let emptySpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        emptySpace.width = 23
        let profileButton = UIBarButtonItem(customView: profileButton)
        
        navigationItem.rightBarButtonItems = [emptySpace, profileButton]
    }
    
    @objc private func pushProfilePage() {
        let profileViewController = ProfileViewController(user: user ?? User())
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func pushSelectedService(with service: Service) {
        let descriptionViewController = DescriptionViewController(user: user, service: service, delegate: self)
        navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
}

// MARK: - Delegation

extension ViewController: DescriptionViewControllerDelegate {
    func updateQuotas(user: User) {
        self.user = user
    }
}

// MARK: - FilterBarCollectionViewDelegate

protocol FilterCollectionViewDelegate: AnyObject {
    func tapFilterButton(with filter: String)
}

extension ViewController: FilterCollectionViewDelegate {
    func tapFilterButton(with filter: String) {
        selectedFilter = filter
        filterServices()
        filterBarCollectionView.reloadData()
        servicesCollectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedService = selectedServices[indexPath.item]
        pushSelectedService(with: selectedService)
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterBarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterBarCollectionViewCell.reuse, for: indexPath) as! FilterBarCollectionViewCell
            let filter = filters[indexPath.item]
            cell.configure(with: filter, isSelected: selectedFilter == filter, delegate: self)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.reuse, for: indexPath) as! ServicesCollectionViewCell
            let service = selectedServices[indexPath.item]
            cell.configure(with: service)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterBarCollectionView {
            return filters.count
        } else {
            return selectedServices.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == filterBarCollectionView {
            return UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        } else {
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == filterBarCollectionView {
            return CGSize(width: 116, height: 32)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 184)
        }
        
    }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        serviceNames = allServices.map { $0.getName() }
        
        if searchText == "" {
            selectedServices = allServices
        }
        
        for word in serviceNames {
            if word.uppercased().contains(searchText.uppercased()) {
                selectedServices = allServices.filter { word == $0.getName() }
            }
        }
        
        servicesCollectionView.reloadData()
    }
}

