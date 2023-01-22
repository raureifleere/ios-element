//
//  someCollectionViewCell.swift
//  tryGalleryWithoutTableView
//
//  Created by Bibisara Kenesova on 19.01.2023.
//

import UIKit
import SnapKit

class someCollectionViewCell: UICollectionViewCell {
    static let identifier = "someCollectionViewCell"
    
    
    private lazy var someView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.addSubview(someLabel)
        someLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return view
    }()
    
    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = .label
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
    
    //MARK: - change text in the label
    func setText(with string: String) {
        someLabel.text = string
    }
    
    //MARK: - change color of view
    func otherColor(with color: UIColor) {
        someView.backgroundColor = color
    }
}

private extension someCollectionViewCell {
    //MARK: - setup Views and constrains in CollectionViewCell
    func setupViews() {
        contentView.addSubview(someView)
    }
    
    func setupConstraints() {
        someView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
