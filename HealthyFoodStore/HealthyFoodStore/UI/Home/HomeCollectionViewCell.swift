//
//  HomeCollectionViewCell.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 24.02.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let popularsIdentifier = "populars"
    static let recomendedIdentifier = "recomended"
    
    
    //MARK: Properties
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    
    //MARK: Overriding methods
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        nameLabel.text = nil
        priceLabel.text = nil
    }
    
    //MARK: Methods
    public func configure(image: UIImage, name: String, price: String) {
        embedView()
        setupView(image: image, name: name, price: price)
        setupLayout()
    }
    private func embedView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        
    }
    private func setupView(image: UIImage, name: String, price: String) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = AppColors.customGreen
        
        nameLabel.text = name
        nameLabel.textColor = AppColors.customGreen
        nameLabel.font = .systemFont(ofSize: 15)
        
        priceLabel.text = price
        nameLabel.textColor = AppColors.customGreen
        priceLabel.font = .systemFont(ofSize: 14)
    }
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20)
        ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            priceLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            priceLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5)
        ])
    }
}
