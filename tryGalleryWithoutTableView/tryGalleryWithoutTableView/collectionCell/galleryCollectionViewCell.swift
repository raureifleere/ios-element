//
//  galleryCollectionViewCell.swift
//  tryGalleryWithoutTableView
//
//  Created by Bibisara Kenesova on 22.01.2023.
//

import UIKit
import SnapKit

class galleryCollectionViewCell: UICollectionViewCell {
    static let identifier2 = "galleryCollectionViewCell"
    
    private lazy var imageInCell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func for change photos
    func setImage(with string: String) {
        imageInCell.image = UIImage(named: string)
    }
}


//MARK: - setup Views and constraints

private extension galleryCollectionViewCell {
    func setupViews() {
        contentView.addSubview(imageInCell)
    }
    
    func setupConstrains() {
        imageInCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
