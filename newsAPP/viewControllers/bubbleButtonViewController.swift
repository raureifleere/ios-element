//
//  bubbleButtonViewController.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 21.02.2023.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire

final class bubbleButtonViewController: UIViewController {
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Hello :)\nChoose newsgroup"
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 15
        return stackview
    }()
    
    private lazy var buttonWallStreet: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("World News", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemCyan

        return button
    }()
    
    private lazy var buttonApple: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("Apple", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemMint
        
        return button
    }()
    
    private lazy var buttontechCrunch: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("Tech Crunch", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemOrange
        
        return button
    }()
    
    private lazy var buttonTesla: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("Tesla", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        
        return button
    }()
    
    //MARK: objc func
    
    @objc func wallStreetPress() {
        let vc = wallStreetViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func applePress() {
        navigationController?.pushViewController(appleViewController(), animated: true)
    }
    
    @objc func techCrunchPress() {
        navigationController?.pushViewController(techCrunchViewController(), animated: true)
    }
    
    @objc func teslaPress() {
        navigationController?.pushViewController(teslaViewController(), animated: true)
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        setupViews()
        setupConstrains()
        
        buttonApple.addTarget(self, action: #selector(applePress), for: .touchUpInside)
        buttonWallStreet.addTarget(self, action: #selector(wallStreetPress), for: .touchUpInside)
        buttontechCrunch.addTarget(self, action: #selector(techCrunchPress), for: .touchUpInside)
        buttonTesla.addTarget(self, action: #selector(teslaPress), for: .touchUpInside)
    }

}

//MARK: - Setup Views and Constraints methods

private extension bubbleButtonViewController {
    
    func setupViews() {
        view.addSubview(stackView)
        view.addSubview(helloLabel)
        stackView.addArrangedSubview(buttonWallStreet)
        stackView.addArrangedSubview(buttonApple)
        stackView.addArrangedSubview(buttontechCrunch)
        stackView.addArrangedSubview(buttonTesla)
    }
    
    func setupConstrains() {
        stackView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        helloLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-20)
            make.height.equalToSuperview().multipliedBy(0.2)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
        }
        
        buttonWallStreet.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }

        buttonApple.snp.makeConstraints { make in
            make.top.equalTo(buttonWallStreet.snp.bottom).offset(12)
            make.height.equalToSuperview().multipliedBy(0.2)
        }

        buttontechCrunch.snp.makeConstraints { make in
            make.top.equalTo(buttonApple.snp.bottom).offset(12)
            make.height.equalToSuperview().multipliedBy(0.2)
        }

        buttonTesla.snp.makeConstraints { make in
            make.top.equalTo(buttontechCrunch.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
}
