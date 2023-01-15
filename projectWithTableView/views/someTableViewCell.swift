//
//  someTableViewCell.swift
//  projectWithTableView
//
//  Created by Bibisara Kenesova on 14.01.2023.
//

import UIKit
import SnapKit

class someTableViewCell: UITableViewCell {
    
    static let identifier = "someTableViewCell"
    //MARK: - Objects
    //два label, которые положу в UIView
    private lazy var place: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //View с текстом
    private lazy var viewInCell: UIView = {
        let view = UIView()
        view.addSubview(place)
        view.addSubview(price)
        
        place.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.7)
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(place.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        return view
    }()
    
    //картинка
    private lazy var imageInCell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Функции для заполнения данных с туром, ценой и картинкой
    func setTextTour(with string: String) {
        place.text = string
    }
    
    func setTextPrice(with string: String) {
        price.text = string
    }
    
    func setImage(with string: String) {
        imageInCell.image = UIImage(named: string)
    }
    
}

//MARK: - setup Views and Constrains methods

private extension someTableViewCell {
    func setupViews() {
        contentView.addSubview(viewInCell)
        contentView.addSubview(imageInCell)
        
    }
    
    func setupConstrains() {
        //MARK: -text constrains
        viewInCell.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        //MARK: -Image constrains
        imageInCell.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(3)
            make.leading.equalTo(viewInCell.snp.trailing).inset(-10)
            make.height.equalToSuperview()
        }
        
    }
}
