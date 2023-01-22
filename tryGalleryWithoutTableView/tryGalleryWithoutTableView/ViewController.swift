//
//  ViewController.swift
//  tryGalleryWithoutTableView
//
//  Created by Bibisara Kenesova on 18.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - Data
    let photos: [Photo] = photoBank.allPhotos()
    
    let texts: [TextAndColors] = someTextandColors.allTexts()
    
    //MARK: - Creating labels
    
    //label of buttons
    private lazy var firstHeader: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Меняются цвета"
        return label
    }()
    
    //gallery
    private lazy var secondHeader: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Галерея"
        return label
    }()
    
    //last label in page
    private lazy var lastLabelInPage: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 60)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Здесь могла бы быть ваша реклама"
        return label
    }()
    
    //MARK: - Creatind someCollectionView
    private lazy var someCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 100, height: someCollectionView.frame.size.height)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(someCollectionViewCell.self, forCellWithReuseIdentifier: "someCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //MARK: - Creatind galleryCollectionView
    private lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: galleryCollectionView.frame.size.width - 5, height: galleryCollectionView.frame.size.height)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(galleryCollectionViewCell.self, forCellWithReuseIdentifier: "galleryCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //someCollectionView
        someCollectionView.dataSource = self
        someCollectionView.delegate = self
        
        //galleryCollectionView
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        
        setupViews()
        setupConstrains()
    }


}

//MARK: - ?????? Спросить в четверг CollectionView Delegate Flow Layout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

//MARK: - CollectionView Delegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case someCollectionView:
            return CGSize(width: 200, height: someCollectionView.frame.size.height - 10)
        case galleryCollectionView:
            return CGSize(width: galleryCollectionView.frame.size.width - 10, height: galleryCollectionView.frame.size.height - 10)
        default:
            return CGSize(width: 200, height: 10)
        }
    }
    
    //MARK: - Press on cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == someCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! someCollectionViewCell
            cell.setText(with: texts[indexPath.item].labelName)
            cell.otherColor(with: texts[indexPath.item].backgroundcolor)
            
        }
    }
    
}


//MARK: - someCollectionView datasource methods
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == someCollectionView {
            return texts.count
        } else if collectionView == galleryCollectionView {
            return photos.count
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == someCollectionView {
            guard let cell = someCollectionView.dequeueReusableCell(withReuseIdentifier: "someCollectionViewCell", for: indexPath) as? someCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            //cell.backgroundColor = .yellow
            //контент из цвета и текста
            cell.setText(with: "Tap me!")
            
            return cell
        } else if collectionView == galleryCollectionView {
            guard let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "galleryCollectionViewCell", for: indexPath) as? galleryCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            //cell.backgroundColor = .systemRed
            //контент из фото галереи
            cell.setImage(with: photos[indexPath.item].imageName)
            
            return cell
        } else { return UICollectionViewCell() }
        
    }
    
}


//MARK: - Setup Views and Constrains

private extension ViewController {
    func setupViews() {
        view.addSubview(firstHeader)
        view.addSubview(someCollectionView)
        view.addSubview(secondHeader)
        view.addSubview(galleryCollectionView)
        view.addSubview(lastLabelInPage)
    }
    
    func setupConstrains() {
        firstHeader.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-5)
            make.trailing.leading.equalToSuperview().offset(10)
        }
        
        someCollectionView.snp.makeConstraints { make in
            make.top.equalTo(firstHeader.snp.bottom).inset(-5)
            make.trailing.leading.equalToSuperview().offset(5)
            make.height.equalToSuperview().dividedBy(7)
        }
        
        secondHeader.snp.makeConstraints { make in
            make.top.equalTo(someCollectionView.snp.bottom).inset(-5)
            make.trailing.leading.equalToSuperview().offset(10)
        }
        
        galleryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(secondHeader.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().offset(5)
            make.height.equalToSuperview().dividedBy(3)
        }
        
        lastLabelInPage.snp.makeConstraints { make in
            make.top.equalTo(galleryCollectionView.snp.bottom).inset(-15)
            make.trailing.leading.equalToSuperview()
        }
    }
}

