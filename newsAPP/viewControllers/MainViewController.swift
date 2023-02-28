//
//  ViewController.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 17.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var autoriztionView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc = bubbleButtonViewController()
        //разобраться!!!
        //vc.modalPresentationStyle = .pageSheet
        navigationController?.present(vc, animated: true)
        
        setupViews()
        setupConstrains()
    }


}

//MARK: - Setup Views and Constraints methods

private extension MainViewController {
    
    func setupViews() {
        
    }
    
    func setupConstrains() {
        
    }
}
