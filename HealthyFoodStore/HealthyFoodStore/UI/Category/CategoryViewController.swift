//
//  CategoryViewController.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 25.02.2024.
//

import UIKit

class CategoryViewController: UIViewController {
    //MARK: Properties
    private let searchBar = UISearchBar()
    private var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.
        return collectionView
    }()

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
        setupView()
        setupLayout()
    }
    
    //MARK: Methods
    private func embedView() {
        view.addSubview(searchBar)
    }
    
    private func setupView() {
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
    }
    
    private func setupLayout() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension CategoryViewController: UISearchBarDelegate {
    
}
