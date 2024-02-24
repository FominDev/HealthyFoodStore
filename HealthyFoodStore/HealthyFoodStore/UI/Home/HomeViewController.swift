//
//  HomeViewController.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 23.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Properties
    private let profileImageView = UIImageView()
    private let locationButton = UIButton()
    private let horizontalStack = UIStackView()
    private let searchBar = UISearchBar()
    private let popularsLabel = UILabel()
    private var popularsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.popularsIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private let recomendedLabel = UILabel()
    private var recomendedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.recomendedIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private var popularProducts = [Product(name: "Phone", price: "100$", image: UIImage(systemName: "phone")),
                                   Product(name: "Gamepad", price: "50$", image: UIImage(systemName: "gamecontroller")),
                                   Product(name: "Ipad", price: "200$", image: UIImage(systemName: "ipad")),
                                   Product(name: "Charger", price: "30$", image: UIImage(systemName: "bolt.square"))]
    private var recomendedProducts = [Product(name: "Light", price: "50$", image: UIImage(systemName: "gamecontroller")),
                                      Product(name: "Fan", price: "50$", image: UIImage(systemName: "gamecontroller")),
                                      Product(name: "Lamp", price: "200$", image: UIImage(systemName: "gamecontroller")),
                                      Product(name: "Shower", price: "30$", image: UIImage(systemName: "gamecontroller")),
                                      Product(name: "Balloon", price: "10$", image: UIImage(systemName: "gamecontroller"))]
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
        setupView()
        setupLayout()
    }
    
    //MARK: Methods
    private func embedView() {
        
        horizontalStack.addSubview(profileImageView)
        horizontalStack.addSubview(locationButton)
        view.addSubview(horizontalStack)
        view.addSubview(searchBar)
        view.addSubview(popularsLabel)
        view.addSubview(popularsCollectionView)
        view.addSubview(recomendedLabel)
        view.addSubview(recomendedCollectionView)
    }
    
    private func setupView() {
        horizontalStack.axis = .horizontal
        
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.tintColor = AppColors.customGreen
        profileImageView.contentMode = .scaleAspectFit
        
        locationButton.setTitle("Moscow", for: .normal)
        locationButton.setTitleColor(AppColors.customGreen, for: .normal)
        locationButton.layer.cornerRadius = 20
        locationButton.backgroundColor = AppColors.white
        
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        
        popularsLabel.text = "Popular today"
        popularsLabel.textColor = AppColors.customGreen
        popularsLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        popularsCollectionView.backgroundColor = AppColors.background
        popularsCollectionView.delegate = self
        popularsCollectionView.dataSource = self
        
        recomendedLabel.text = "Recomended for you"
        recomendedLabel.textColor = AppColors.customGreen
        recomendedLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        recomendedCollectionView.backgroundColor = AppColors.background
        recomendedCollectionView.delegate = self
        recomendedCollectionView.dataSource = self
        
    }
    
    private func setupLayout() {
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalStack.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: horizontalStack.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationButton.centerYAnchor.constraint(equalTo: horizontalStack.centerYAnchor),
            locationButton.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        popularsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popularsLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30)
        ])
        
        popularsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularsCollectionView.topAnchor.constraint(equalTo: popularsLabel.bottomAnchor, constant: 20),
            popularsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popularsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            popularsCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        recomendedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recomendedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recomendedLabel.topAnchor.constraint(equalTo: popularsCollectionView.bottomAnchor, constant: 50)
        ])
        
        recomendedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recomendedCollectionView.topAnchor.constraint(equalTo: recomendedLabel.bottomAnchor, constant: 20),
            recomendedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recomendedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recomendedCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularsCollectionView {
            return popularProducts.count
        } else {
            return recomendedProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularsCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.popularsIdentifier, for: indexPath) as? HomeCollectionViewCell {
                cell.configure(image: popularProducts[indexPath.row].image!, name: popularProducts[indexPath.row].name, price: popularProducts[indexPath.row].price)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.recomendedIdentifier, for: indexPath) as? HomeCollectionViewCell {
                cell.configure(image: recomendedProducts[indexPath.row].image!, name: recomendedProducts[indexPath.row].name, price: recomendedProducts[indexPath.row].price)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}
