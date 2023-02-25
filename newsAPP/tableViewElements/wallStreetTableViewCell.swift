//
//  wallStreetTableViewCell.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 25.02.2023.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire

class wallStreetTableViewCell: UITableViewCell {
    
    private lazy var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.image = UIImage(named: "testPoster")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var labelView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .label
        label.text = "TEST TEST TEST"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        let number = Int.random(in: 0..<20)
        label.text = "💬\(number)"
        label.textAlignment = .right
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(with model: WallStreetModel) {
        guard let url = URL(string: model.urlToImage) else { fatalError("Incorrect configure backdropPath") }
        DispatchQueue.main.async {
            self.imageViewCell.kf.setImage(with: url)
        }
    }
    
    func configureHeader(with text: String) {
        DispatchQueue.main.async {
            self.headerLabel.text = text
        }
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension wallStreetTableViewCell {
    
    func setupViews() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(labelView)
        labelView.addSubview(headerLabel)
        labelView.addSubview(commentLabel)
    }
    
    func setupConstrains() {
        imageViewCell.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.98)
            make.width.equalToSuperview().multipliedBy(0.47)
            make.centerY.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.leading.equalTo(imageViewCell.snp.trailing).offset(10)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.85)
            make.width.equalToSuperview().multipliedBy(0.95)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.top.equalTo(headerLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
}
