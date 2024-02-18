//
//  OnboardingViewController.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 17.02.2024.
//

import UIKit

//MARK: - OnboardingViewController

class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    private var pages = [OnboardingPageViewController]()
    
    //MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    var viewPresenter: OnboardingViewPresenterProtocol!
    private let finishButton = UIButton()
    
    //MARK: - Initializers
    init(pages: [OnboardingPageViewController] = [OnboardingPageViewController](), viewPresenter: OnboardingViewPresenterProtocol!) {
        self.pages = pages
        self.viewPresenter = viewPresenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        setupPageControl()
        setupFinishButton()
    }
    
}

//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
            finishButton.setTitle(pages[1].buttonText, for: .normal)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
            finishButton.setTitle(pages[2].buttonText, for: .normal)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true)
            finishButton.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Go to tabBar")
        default:
            break
        }
    }
}


//MARK: - Layout

private extension OnboardingViewController {
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.customGreen
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        finishButton.setTitle(title, for: .normal)
        pageControl.isUserInteractionEnabled = false
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    func setupFinishButton() {
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.backgroundColor = AppColors.white
        finishButton.tintColor = AppColors.customGreen
        finishButton.layer.cornerRadius  = 12
        finishButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        finishButton.setTitleColor(AppColors.customGreen, for: .normal)
        finishButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            finishButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -80),
            finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishButton.widthAnchor.constraint(equalToConstant: 250),
            finishButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPageViewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPageViewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
}

//MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPageViewController) {
            pageControl.currentPage = index
            let page = pages[index]
            let title = page.buttonText
            finishButton.setTitle(title, for: .normal)
        }
    }
}

