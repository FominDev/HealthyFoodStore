//
//  OnboardingPageViewController.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 18.02.2024.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    
    //MARK: - Properties
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    var buttonText: String? 
    
    //MARK: - Views
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

private extension OnboardingPageViewController {
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    func setupView() {
        view.backgroundColor = AppColors.customGreen
    }
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = AppColors.white
        descriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = AppColors.white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
    
}
