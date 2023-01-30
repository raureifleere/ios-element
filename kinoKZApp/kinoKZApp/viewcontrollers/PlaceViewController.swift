//
//  PlaceViewController.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 29.01.2023.
//

import UIKit
import SnapKit

final class PlaceViewController: UIViewController {
    
    let placesCategoryList = Constants.PlacesCategory.Headers.allCases
    let placesInformation = Constants.DescriptionBank.allDataCell()
    
    //MARK: View Items
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var placesSearchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchBarStyle = .minimal
        searchbar.placeholder = "Поиск интересных мест"
        return searchbar
    }()
    
    private lazy var placesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.placesCollectionViewCell)
        return collectionview
    }()
    
    private let placesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.placesTableViewCell)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        placesTableView.dataSource = self
        placesTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }

}

//MARK: - CollectionView DataSource methods

extension PlaceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesCategoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.placesCollectionViewCell, for: indexPath) as? PlacesCollectionViewCell else {return UICollectionViewCell() }
        cell.setupHeaders(with: placesCategoryList[indexPath.item].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
    
    
}

//MARK: - CollectionView Delegate methods

extension PlaceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = placesCategoryList[indexPath.item].rawValue
        label.sizeToFit()
        return CGSize (width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15)
    }
}

//MARK: - TableView DataSource methods

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placesInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.placesTableViewCell, for: indexPath) as? PlacesTableViewCell else { return UITableViewCell() }
        cell.changePhoto(with: placesInformation[indexPath.item].imageName)
        cell.changeHeader(with: placesInformation[indexPath.item].name)
        cell.changeAdress(with: placesInformation[indexPath.item].adress)
        return cell
    }
    
    
}

//MARK: - TableView Delegate methods

extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.1
    }
}

//MARK: - Setup Views and Constraints methods

private extension PlaceViewController {
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(placesSearchBar)
        contentView.addSubview(placesCollectionView)
        contentView.addSubview(placesTableView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        
        placesSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        
        placesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(placesSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.07)
        }
        
        placesTableView.snp.makeConstraints { make in
            make.top.equalTo(placesCollectionView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view).multipliedBy(2)
        }
    }
}
