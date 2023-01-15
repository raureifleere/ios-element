//
//  ViewController.swift
//  projectWithTableView
//
//  Created by Bibisara Kenesova on 12.01.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    //MARK: - Data
    private var titleOfSection: [String] = ["Азия", "Европа", "Австралия", "Африка", "Антарктида", "Америка"]
    
    private var tours: [[String]] = [["Китай", "Япония", "Тайланд", "Южная Корея", "Вьетнам"], ["Франция", "Германия", "Италия", "Чехия"], ["Канберра", "Новый Южный Уэльс", "Виктория"], ["ЮАР", "Египет", "Марокко", "Эфиопия"], ["В пасть к северным медведям"], ["США", "Аргентина", "Бразилия", "Куба", "Канада"]]
    
    private var priceArray: [[String]] = [["713 000", "1 483 000", "337 000", "956 000", "650 000"], ["323 000", "205 520", "150 000", "257 900"], ["1 000 000", "978 930", "1 920 929"], ["249 000", "247 000", "456 000", "232 000"], ["1 000 000 000 000"], ["890 000", "892 282", "289 999", "999 999", "278 987"]]
    
    private var imageArray: [[String]] = [["china", "japan", "tailand", "korea", "vietnam"], ["fran", "germany", "italy", "чехия"], ["canberra", "austrelia", "canberra"], ["юар", "egypt", "marokko", "africa"], ["bear"], ["usa", "argentina", "brazil", "argentina", "kanada"]]
    
    //MARK: - create TableView
    
    private lazy var someTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(someTableViewCell.self, forCellReuseIdentifier: someTableViewCell.identifier)
        tableview.backgroundColor = .systemIndigo
        return tableview
    }()
    

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemCyan
        
        someTableView.dataSource = self
        someTableView.delegate = self
        
        setupViews()
        setupConstrains()
    }


}

//MARK: - TableView datasource methods

extension ViewController: UITableViewDataSource {
    //сколько секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleOfSection.count
    }
    
    // свойства заголовка для каждой секции
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemIndigo
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    //текст в заголовках
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleOfSection[section]
    }
    
    //количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours[section].count
    }
    
    //работа с ячейками
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //тут подумала, что лучше в проектах пользоваться optional и возвращать пустую ячейку
        //поэтому сделала обертку в guard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: someTableViewCell.identifier, for: indexPath) as? someTableViewCell else { return UITableViewCell() }
        
        // Настройка текста внутри ячеек
        cell.setTextTour(with: "\(indexPath.row + 1). \(tours[indexPath.section][indexPath.item])")
        cell.setTextPrice(with: "Цена: \(priceArray[indexPath.section][indexPath.item]) тг")
        
        // Настройка картинок внутри ячеек
        cell.setImage(with: "\(imageArray[indexPath.section][indexPath.item])")
        return cell
    }
    
    
}

//MARK: - TableView delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}


//MARK: - Setup views and constrains methods

private extension ViewController {
    func setupViews() {
        view.addSubview(someTableView)
    }
    
    func setupConstrains() {
        someTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
