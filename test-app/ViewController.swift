//
//  ViewController.swift
//  test-app
//
//  Created by viktor on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var targetValue = 0
    var score = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    @IBAction func showAlert() {
        let currentValue = lroundf(slider.value)
        let diffrence = abs(currentValue - targetValue)
        var currentScore = 100 - diffrence
        
        let title : String
        
        if diffrence == 0 {
            title = "Excelent"
            currentScore += 100
        } else if diffrence < 5 {
            title = "Very close"
            if diffrence < 3 {
                currentScore += 50
            }
        } else if diffrence < 10 {
            title = "Not bad"
        } else {
            title = "Try again :("
        }
        
        let message = "Your score: \(currentScore)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: { _ in self.newRound()
            
        })
        
        alert.addAction(action)
        present(alert, animated: true)
        
        score += currentScore
        round += 1
    }
    
    @IBAction func restart() {
        score = 0
        round = 1
        newRound()
    }

    func newRound() {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
        
        slider.value = 50
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        view.layer.add(transition, forKey: nil)
    }
}
