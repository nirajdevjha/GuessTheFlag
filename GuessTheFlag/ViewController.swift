//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Niraj Jha on 27/03/19.
//  Copyright © 2019 Niraj Jha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    @IBOutlet weak var flagBtn1: UIButton!
    @IBOutlet weak var flagBtn2: UIButton!
    @IBOutlet weak var flagBtn3: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        setupUI()
        askQuestions()
    }
    
    // MARK: - Private
    
    private func askQuestions(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagBtn1.setImage(UIImage(named: countries[0]), for: .normal)
        flagBtn2.setImage(UIImage(named: countries[1]), for: .normal)
        flagBtn3.setImage(UIImage(named: countries[2 ]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    private func setupUI() {
        flagBtn1.layer.borderWidth = 1.0
        flagBtn2.layer.borderWidth = 1.0
        flagBtn3.layer.borderWidth = 1.0
        flagBtn1.layer.borderColor = UIColor.lightGray.cgColor
        flagBtn2.layer.borderColor = UIColor.lightGray.cgColor
        flagBtn3.layer.borderColor = UIColor.lightGray.cgColor
    }

    @IBAction func flagButtonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        let askQuestionAction = UIAlertAction(title: "Continue", style: .default, handler: askQuestions)
        
        alertController.addAction(askQuestionAction)
        present(alertController, animated: true, completion: nil)
    }
}

