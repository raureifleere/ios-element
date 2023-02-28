//
//  intoWallStreetViewController.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 25.02.2023.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire

class intoWallStreetViewController: UIViewController {
    
    var newsModel: WallStreetModel? {
        //MARK: ??????????
        didSet {
            guard let url = URL(string: newsModel?.urlToImage ?? "") else { fatalError("Incorrect configure backdropPath") }
            DispatchQueue.main.async {
                self.mainImageView.kf.setImage(with: url)
            }
            headerLabel.text = newsModel?.title
            datePostLabel.text = newsModel?.publishedAt
        }
    }
    
    private lazy var contentView = UIView()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .label
        label.text = "TEST TEST TEST TEST"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var someView = UIView()
    
    private lazy var datePostLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .label
        label.text = "Today, 2023-03-09"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var countOfViewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .label
        label.text = "◎ \(Int.random(in: 0..<10000))"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testPoster")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var basicTableView: UITableView = {
        let teableview = UITableView()
        teableview.register(intoWallStreetTableViewCell.self, forCellReuseIdentifier: Constans.Identifiers.intoWallStreetTableViewCell)
        return teableview
    }()
    
//    lazy var newsTextLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        //var maximumLabelSize: CGSize = CGSize(width: 280, height: 999)
//        //label.sizeThatFits(maximumLabelSize)
//        label.text = labelText
//        return label
//    }()
//
//    var labelText = ""
//
//    //try to create dinamic label
//    static func someHeight(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
//        var currentHeight: CGFloat!
//
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
//        label.text = text
//        label.font = font
//        label.numberOfLines = 0
//        label.sizeToFit()
//        label.lineBreakMode = .byWordWrapping
//        currentHeight = label.frame.height
//        label.removeFromSuperview()
//        return currentHeight
//    }
//
//    lazy var containerViewHeight: CGFloat = intoWallStreetViewController.someHeight(text: labelText, font: UIFont.systemFont(ofSize: 15), width: view.frame.width)
    
    // заполнение
    func configureHeader(with text: String) {
        DispatchQueue.main.async {
            self.headerLabel.text = text
        }
    }
    
    func configureDate(with text: String) {
        DispatchQueue.main.async {
            self.datePostLabel.text = text
        }
    }
    
    func configureImage(with model: WallStreetModel) {
        guard let url = URL(string: model.urlToImage) else { fatalError("Incorrect configure backdropPath") }
        DispatchQueue.main.async {
            self.mainImageView.kf.setImage(with: url)
        }
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //WallStreetAPICaller.shared.delegate = self
        WallStreetAPICaller.shared.fetchRequest()
        
        basicTableView.dataSource = self
        basicTableView.delegate = self
        
        setupViews()
        setupConstrains()
    }

}

//extension intoWallStreetViewController: WallstreetAPICallerDelegate {
//    func didUpdateMovieList(with newsList: [WallStreetModel]) {
//        self.newsModel = newsList
//        DispatchQueue.main.async {
//            //items
////        }
////    }
//
//    func didFailWithError(_ error: Error) {
//        print("Error wall Street news", error)
//    }
//
//}

//MARK: - TableView Data source methods

extension intoWallStreetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constans.Identifiers.intoWallStreetTableViewCell, for: indexPath) as? intoWallStreetTableViewCell else { return UITableViewCell() }
        cell.configureArticle(with: newsModel?.content ?? "")
        return cell
    }
    
    
}

//MARK: - TableView Delegate methods

extension intoWallStreetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.15
    }
}

//MARK: - Setup Views and Constraints methods

private extension intoWallStreetViewController {
    
    func setupViews() {
        view.addSubview(basicTableView)
        basicTableView.tableHeaderView = contentView
        contentView.addSubview(headerLabel)
        contentView.addSubview(someView)
        contentView.addSubview(mainImageView)
        someView.addSubview(datePostLabel)
        someView.addSubview(countOfViewsLabel)
    }
    
    func setupConstrains() {
        basicTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        basicTableView.tableHeaderView?.layoutIfNeeded()
        basicTableView.tableHeaderView?.frame.size = .init(width: view.frame.width,
                                                          height: view.frame.height * 0.5)
        
        
        headerLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().offset(5)
            make.height.equalTo(view).multipliedBy(0.07)
        }
        
        someView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(headerLabel.snp.bottom).offset(7)
            make.height.equalTo(view).multipliedBy(0.04)
        }
        
        datePostLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(headerLabel.snp.bottom).offset(7)
            make.height.equalToSuperview()
        }
        
        countOfViewsLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(10)
            make.leading.equalTo(datePostLabel.snp.trailing).offset(5)
            make.top.equalTo(headerLabel.snp.bottom).offset(7)
            make.height.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(datePostLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
    }
}
