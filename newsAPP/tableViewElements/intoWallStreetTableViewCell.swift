//
//  intoWallStreetTableViewCell.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 26.02.2023.
//

import UIKit
import SnapKit

class intoWallStreetTableViewCell: UITableViewCell {
    
    lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var maximumLabelSize: CGSize = CGSize(width: 280, height: 900)
        label.sizeThatFits(maximumLabelSize)
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
    
    func configureArticle(with text: String) {
        DispatchQueue.main.async {
            self.newsTextLabel.text = text
        }
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension intoWallStreetTableViewCell {
    
    func setupViews() {
        contentView.addSubview(newsTextLabel)
    }
    
    func setupConstrains() {
        newsTextLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
