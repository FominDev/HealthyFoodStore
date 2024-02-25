//
//  CategoryCollectionViewCell.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 25.02.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    //MARK: Properties
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    //MARK: Methods
    public func configure(image: UIImage, name: String) {
        embedView()
        setupView(image: image, name: name)
        setupLayout()
    }
    
    private func embedView() {
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    private func setupView(image: UIImage, name: String) {
        self.layer.cornerRadius = 5
        self.backgroundColor = AppColors.white
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        
        nameLabel.text = name
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.textColor = AppColors.customGreen
        nameLabel.textAlignment = .center
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
