//
//  ViewController.swift
//  Dice-Marathon
//
//  Created by User on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let logoImage = UIImageView()
    
    let diceStackView = UIStackView()
    let firstDiceImage = UIImageView()
    let secondDiceImage = UIImageView()
    
    let rollButton = UIButton(type: .system)
    
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
        
        // LogoImage
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "DiceLogo")
        logoImage.contentMode = .scaleAspectFit
        
        // DiceStackView
        diceStackView.translatesAutoresizingMaskIntoConstraints = false
        diceStackView.axis = .horizontal
        diceStackView.distribution = .equalSpacing
        
        // FirstDiceImage
        firstDiceImage.translatesAutoresizingMaskIntoConstraints = false
        firstDiceImage.image = UIImage(named: "DiceTwo")
        
        // SecondDiceImage
        secondDiceImage.translatesAutoresizingMaskIntoConstraints = false
        secondDiceImage.image = UIImage(named: "DiceFive")
        
        // RollButton
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        rollButton.tintColor = .white
        rollButton.layer.cornerRadius = 8
        rollButton.setTitle("Roll", for: [])
        rollButton.backgroundColor = UIColor(named: "RollButtonColor")
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        diceStackView.addArrangedSubview(firstDiceImage)
        diceStackView.addArrangedSubview(secondDiceImage)
        
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(diceStackView)
        view.addSubview(rollButton)
        
        // BackgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
        ])
        
        // LogoImage
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            logoImage.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: logoImage.trailingAnchor, multiplier: 2),
        ])
        
        // DiceStackView
        NSLayoutConstraint.activate([
            diceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            diceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 8),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: diceStackView.trailingAnchor, multiplier: 8),
        ])
        
        // RollButton
        NSLayoutConstraint.activate([
            rollButton.topAnchor.constraint(equalToSystemSpacingBelow: diceStackView.bottomAnchor, multiplier: 30),
            rollButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 12),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rollButton.trailingAnchor, multiplier: 12),
        ])
    }
}

// MARK: - Actions
extension ViewController {
    @objc func rollButtonPressed() {
        randomImage(imageView: firstDiceImage)
        randomImage(imageView: secondDiceImage)
    }
    
    private func randomImage(imageView: UIImageView) {
        let ranNum = Int.random(in: 1...6)
        
        switch ranNum {
        case 1:
            imageView.image = UIImage(named: "DiceOne")
        case 2:
            imageView.image = UIImage(named: "DiceTwo")
        case 3:
            imageView.image = UIImage(named: "DiceThree")
        case 4:
            imageView.image = UIImage(named: "DiceFour")
        case 5:
            imageView.image = UIImage(named: "DiceFive")
        case 6:
            imageView.image = UIImage(named: "DiceSix")
        default:
            imageView.image = UIImage(named: "DiceOne")
        }
    }
}
