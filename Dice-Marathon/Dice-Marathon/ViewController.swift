//
//  ViewController.swift
//  Dice-Marathon
//
//  Created by User on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        // BackgroundImage
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "Background")
    }
    
    func layout() {
        view.addSubview(backgroundImage)
        
        // BackgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
        ])
    }
}

