//
//  ViewController.swift
//  Three Buttons
//
//  Created by fullzoom on 06.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - CREATE BUTTONS
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First Button", for: .normal)
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        button.configuration = configuration
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        return button
    }()
    
    
    lazy var secondMediumButtom: UIButton = {
        let button = UIButton()
        button.setTitle("Second Medium Button", for: .normal)
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        button.configuration = configuration
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.setTitle("Third", for: .normal)
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        button.configuration = configuration
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(presentModalController(_ :)), for: .touchUpInside)
        return button
    }()
    
    
// MARK: - Animation Buttons
    @objc func touchDown(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @objc func touchUpInside(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = .identity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buttonsConstraints()
    }
    
    // MARK: - PRESENT MODAL CONTROLLER
    @objc func presentModalController(_ sender: UIButton){
        let viewControllerToPresent = UIViewController()
        viewControllerToPresent.view.backgroundColor = .white
        present(viewControllerToPresent, animated: true)
    }
    
    // MARK: - Constraints for Buttons
    private func buttonsConstraints(){
        view.addSubview(firstButton)
        view.addSubview(secondMediumButtom)
        view.addSubview(thirdButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondMediumButtom.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            secondMediumButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondMediumButtom.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondMediumButtom.bottomAnchor, constant: 10)
        ])
    }
}
