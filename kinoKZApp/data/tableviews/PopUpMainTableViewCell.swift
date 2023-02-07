//
//  PopUpMainTableViewCell.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 07.02.2023.
//

import UIKit

class PopUpMainTableViewCell: UITableViewCell {
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var someView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var nameOfFilm: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var dateOfFilm: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var definitionOfFilm: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemGray2
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
    func changePhoto(with posterPath: String) {
        guard let url = URL(string: "\(Constants.Links.imageUrl)\(posterPath)") else { fatalError("Incorrect link posterPath") }
        DispatchQueue.main.async {
            self.mainImageView.kf.setImage(with: url)
        }
    }
    
    //change Title
    func changeTitle(with title: String) {
        DispatchQueue.main.async {
            self.nameOfFilm.text = title
        }
    }
    
    //change Date
    func changeData(with text: String) {
        DispatchQueue.main.async {
            self.dateOfFilm.text = text
        }
    }
    
    //change definition
    func changeDefinition(with text: String) {
        DispatchQueue.main.async {
            self.definitionOfFilm.text = text
        }
    }
}

//MARK: - Setup Views and Constraints methods

private extension PopUpMainTableViewCell {
    
    func setupViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(mainImageView)
        mainView.addSubview(someView)
        someView.addSubview(nameOfFilm)
        someView.addSubview(dateOfFilm)
        someView.addSubview(definitionOfFilm)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalToSuperview().multipliedBy(0.95)
        }
        someView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(mainImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview()
        }
        
        nameOfFilm.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        dateOfFilm.snp.makeConstraints { make in
            make.top.equalTo(nameOfFilm.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        definitionOfFilm.snp.makeConstraints { make in
            make.top.equalTo(dateOfFilm.snp.bottom).offset(10)
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
}
