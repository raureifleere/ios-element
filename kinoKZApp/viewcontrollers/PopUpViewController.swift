//
//  PopUpViewController.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 07.02.2023.
//

import UIKit
import SnapKit
import Kingfisher

class PopUpViewController: UIViewController {
    
    var apicaller = PlacesAPICaller()
    var nowPlayingList: [NowPlayingModel] = []
    
    //MARK: - View Items
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PopUpMainTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.popUpMainTableViewCell)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private lazy var nowPlayingSearchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchBarStyle = .minimal
        searchbar.placeholder = "Что идет сейчас?"
        return searchbar
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ssmkxlslx"
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        mainTableView.dataSource = self
        mainTableView.delegate = self
        apicaller.delegate = self
        
        apicaller.fetchRequest()
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Places API Caller delegate methods

extension PopUpViewController: PlacesAPICallerDelegate {
    func didUpdateMovieList(with nowPlayingList: [NowPlayingModel]) {
        self.nowPlayingList.append(contentsOf: nowPlayingList)
    }
    
    func didFailWithError(_ error: Error) {
        print("Filed: ", error)
    }
    
    
}

//MARK: - TableView DataSource methods

extension PopUpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowPlayingList.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.popUpMainTableViewCell, for: indexPath) as? PopUpMainTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .systemBackground
        cell.changePhoto(with: nowPlayingList[indexPath.item + 1].posterPath)
        cell.changeTitle(with: nowPlayingList[indexPath.item + 1].title)
        cell.changeData(with: nowPlayingList[indexPath.item + 1].releaseDate)
        cell.changeDefinition(with: nowPlayingList[indexPath.item + 1].overview)
        return cell
    }
}

//MARK: - TableView Delegate methods

extension PopUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.25
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension PopUpViewController {
    
    func setupViews() {
        view.addSubview(mainTableView)
        mainTableView.addSubview(headerView)
        
        //спросить в четверг
        
//        mainTableView.tableHeaderView = headerView
//        headerView.addSubview(nowPlayingSearchBar)
//        headerView.addSubview(label)
        
    }
    
    func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges).inset(5)
        }
//        headerView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//            make.height.equalTo(view).multipliedBy(0.2)
//        }
//        nowPlayingSearchBar.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.2)
//        }
//        nowPlayingSearchBar.searchTextField.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        label.snp.makeConstraints { make in
//            make.top.equalTo(nowPlayingSearchBar.snp.bottom)
//            make.leading.trailing.bottom.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.5)
//        }
    }
}

