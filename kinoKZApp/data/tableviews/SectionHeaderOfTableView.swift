//
//  SectionHeaderOfTableView.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 30.01.2023.
//

import UIKit
import SnapKit

final class SectionHeaderOfTableView: UIView {
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .label
        return label
    }()
    
    private lazy var allLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemOrange
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
    
    //change text of header
    func configureHeader(with text: String, number: Int) {
        categoryLabel.text = text
        allLabel.text = "Все \(number)"
    }
}

//MARK: - Setup Views and Constraints methods

private extension SectionHeaderOfTableView {
    
    func setupViews() {
        addSubview(categoryLabel)
        addSubview(allLabel)
    }
    
    func setupConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        allLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}
