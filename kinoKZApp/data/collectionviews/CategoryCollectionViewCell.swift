//
//  CategoryCollectionViewCell.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 30.01.2023.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: change text in cells
    func configureHeaders(with text: String) {
        categoryNameLabel.text = text
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameLabel)
    }
    
    func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
