//
//  wallStreetCollectionViewCell.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 25.02.2023.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire

class wallStreetCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testPoster")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var headerOnImage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionViewImage(with model: WallStreetModel) {
        guard let url = URL(string: model.urlToImage) else { fatalError("Incorrect configure backdropPath") }
        DispatchQueue.main.async {
            self.imageViewCell.kf.setImage(with: url)
        }
    }
    
    func configureHeader(with text: String) {
        DispatchQueue.main.async {
            self.headerOnImage.text = text
        }
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension wallStreetCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(headerOnImage)
    }
    
    func setupConstrains() {
        imageViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerOnImage.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(imageViewCell.snp.bottom).inset(10)
        }
    }
}
