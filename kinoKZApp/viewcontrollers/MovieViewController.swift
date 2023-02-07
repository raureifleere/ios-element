//
//  MovieViewController.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 29.01.2023.
//

import UIKit
import SnapKit

final class MovieViewController: UIViewController {
    
    var apiCaller = APICaller()
    var movieList: [MovieModel] = []
    
    //MARK: View Items
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Constants.Categories.Category.allCases
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Фильмы, кинотеатры, новости"
        return searchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        apiCaller.delegate = self
        apiCaller.fetchRequest()
        
        setupViews()
        setupConstraints()
    }

}

//MARK: - API Caller delegate methods

extension MovieViewController: APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel]) {
        self.movieList.append(contentsOf: movieList)
    }
    
    func didFailWithError(_ error: Error) {
        print("Failer with error: ", error)
    }
    
    
}

//MARK: - CollectionView DataSource methods

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryList.count
        }
        else if collectionView == trendingCollectionView {
            return movieList.count
        }
        else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            cell.configureHeaders(with: categoryList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        }
        else if collectionView == trendingCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as? TrendingCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: movieList[indexPath.row].backdropPath)
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
}

//MARK: - CollectionView Delegate methods

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            let label = UILabel()
            label.text = categoryList[indexPath.row].rawValue
            label.sizeToFit()
//            return label.systemLayoutSizeFitting(
//                CGSize(width: label.frame.width, height: .greatestFiniteMagnitude),
//                withHorizontalFittingPriority: .defaultLow,
//                verticalFittingPriority: .fittingSizeLevel)
            label.sizeToFit()
            return CGSize (width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15)
        }
        else if collectionView == trendingCollectionView {
            let height = collectionView.frame.size.height
            return CGSize(width: view.frame.size.width * 0.75, height: height)
        }
        else {
            return CGSize(width: 10, height: 100)
        }
    }
}

//MARK: - TableView DataSource methods

extension MovieViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderOfTableView()
        view.configureHeader(with: String(categoryList[section + 1].rawValue.dropFirst()), number: categoryList.count)
        return view
    }
}

//MARK: - TableView Delegate methods

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.4
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension MovieViewController {
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(trendingCollectionView)
        contentView.addSubview(categoryTableView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.07)
        }
        
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.2)
        }
        
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.height.equalTo(view).multipliedBy(2)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

