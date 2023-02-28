//
//  wallStreetViewController.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 21.02.2023.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire

class wallStreetViewController: UIViewController {
    
    private lazy var newsModelList: [WallStreetModel] = []
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(wallStreetTableViewCell.self, forCellReuseIdentifier: Constans.Identifiers.wallstreetTableViewCell)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchBarStyle = .minimal
        searchbar.placeholder = "What article did you find?"
        searchbar.resignFirstResponder()
        return searchbar
    }()
    
    private lazy var headerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(wallStreetCollectionViewCell.self, forCellWithReuseIdentifier: Constans.Identifiers.wallStreetCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        WallStreetAPICaller.shared.delegate = self
        WallStreetAPICaller.shared.fetchRequest()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        headerCollectionView.dataSource = self
        headerCollectionView.delegate = self
        
        setupViews()
        setupConstrains()
        
    }

}

extension wallStreetViewController: WallstreetAPICallerDelegate {
    func didUpdateMovieList(with newsList: [WallStreetModel]) {
        self.newsModelList = newsList
        DispatchQueue.main.async {
            self.headerCollectionView.reloadData()
            self.mainTableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print("Error wall Street news", error)
    }
    
}

//MARK: - CollectionView Data source methods

extension wallStreetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsModelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constans.Identifiers.wallStreetCollectionViewCell, for: indexPath) as? wallStreetCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCollectionViewImage(with: newsModelList[indexPath.item])
        cell.configureHeader(with: newsModelList[indexPath.item].title)
        return cell
    }
    
}

//MARK: - CollectionView Delegate methods

extension wallStreetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width, height: height)
    }
}

//MARK: - TableView Data source methods

extension wallStreetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constans.Identifiers.wallstreetTableViewCell, for: indexPath) as? wallStreetTableViewCell else { return UITableViewCell() }
        cell.configureImage(with: newsModelList[indexPath.item])
        cell.configureHeader(with: newsModelList[indexPath.item].title)
        return cell
    }
    
    
}

//MARK: - TableView Delegate methods

extension wallStreetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = newsModelList[indexPath.row]
//        let jump = intoWallStreetViewController(model)
        let jump = intoWallStreetViewController()
        jump.newsModel = newsModelList[indexPath.row]
        navigationController?.pushViewController(jump, animated: true)
    }
}

//MARK: - Setup Views and Constraints methods

private extension wallStreetViewController {
    
    func setupViews() {
        view.addSubview(mainTableView)
        //mainTableView.addSubview(headerView)
        mainTableView.tableHeaderView = headerView
        headerView.addSubview(searchBar)
        headerView.addSubview(headerCollectionView)
    }
    
    func setupConstrains() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainTableView.tableHeaderView?.layoutIfNeeded()
        mainTableView.tableHeaderView?.frame.size = .init(width: view.frame.width,
                                                          height: view.frame.height * 0.35)
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        searchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            //make.height.equalTo(view).multipliedBy(0.3)
        }
    }
}
