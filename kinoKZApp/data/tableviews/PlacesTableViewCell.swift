//
//  PlacesTableViewCell.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 30.01.2023.
//

import UIKit
import SnapKit

class PlacesTableViewCell: UITableViewCell {
    
    private lazy var imageViewCell: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 15
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private lazy var someView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //changePhoto
    func changePhoto(with picture: String) {
        imageViewCell.image = UIImage(named: picture)
    }
    
    //change Header
    func changeHeader(with text: String) {
        headerLabel.text = text
    }
    
    //change Adress
    func changeAdress(with adress: String) {
        adressLabel.text = adress
    }
}

//MARK: - Setup Views and Constraints methods

private extension PlacesTableViewCell {
    
    func setupViews() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(someView)
        someView.addSubview(headerLabel)
        someView.addSubview(adressLabel)
    }
    
    func setupConstraints() {
        imageViewCell.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.23)
            make.height.equalToSuperview()
        }
        someView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageViewCell.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}
