//
//  TrendingCollectionViewCell.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 30.01.2023.
//

import UIKit
import SnapKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    private lazy var trendingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testPoster")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with backdropPath: String) {
        guard let url = URL(string: "\(Constants.Links.imageUrl)\(backdropPath)") else { fatalError("Incorrect configure backdropPath") }
        DispatchQueue.main.async {
            self.trendingImageView.kf.setImage(with: url)
        }
    }
}

//MARK: - Setup Views and Constraints methods

private extension TrendingCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(trendingImageView)
    }
    
    func setupConstraints() {
        trendingImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
