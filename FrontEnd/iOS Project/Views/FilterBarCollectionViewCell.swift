//
//  FilterBarCollectionViewCell.swift
//  iOS Project
//
//  Created by William Liu on 11/29/23.
//

import UIKit
import SnapKit

class FilterBarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (View)
    
    private let filterButton = UIButton()
    
    // MARK: - Properties (data)
    
    static let reuse = "FilterBarCollectionViewCellReuse"
    private weak var delegate: FilterCollectionViewDelegate?
    private var currentFilter: String?
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.aFinal.silver
        
        setUpFilterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with filter: String, isSelected: Bool, delegate: FilterCollectionViewDelegate?) {
        
        self.delegate = delegate

        currentFilter = filter
        filterButton.setTitle(filter, for: .normal)
        filterButton.setTitleColor(isSelected ? UIColor.white : UIColor.black, for: .normal)
        filterButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        filterButton.backgroundColor = isSelected ? UIColor.orange : UIColor.lightGray
        
    }
    
    // MARK: - Set Up Views
    
    private func setUpFilterButton() {
        filterButton.layer.cornerRadius = 16
        filterButton.backgroundColor = UIColor.black
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        contentView.addSubview(filterButton)
        
        filterButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Button Helpers
    
    @objc private func filterButtonTapped() {
        delegate?.tapFilterButton(with: self.currentFilter ?? "All")
    }
    
}
