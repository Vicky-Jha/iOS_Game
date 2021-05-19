//
//  ViewController.swift
//  BullsEye
//
//  Created by Vicky Jha on 17/05/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var target: UILabel!
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var roundLable: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var round: Int = 1
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        resetRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

    }

    @IBAction func showAlert() {
    
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let title: String
        
        if difference == 0 {
            title = "Perfert!"
            self.score += 100
        }else if difference < 5 {
            if difference == 1 {
                score += 50
            }
            title = "You almost had is!"
        }else if difference < 10 {
            title = "Pretty good!"
        }else {
            title = "Not even Close"
        }
        
        round += 1
        
        let alert = UIAlertController(title: title, message: "Score is \(points)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            _ in //action in
            self.resetRound()
        })
        
        alert.addAction(action)
        
      self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMove(_ slider: UISlider) {
        currentValue = Int(slider.value)
    }
    
    @IBAction func resetButton() {
        currentValue = 0
        targetValue = 0
        round = 1
        score = 0
        resetRound()
        slider.setValue(1, animated: true)
    }
    
    func resetRound() {
        targetValue = Int.random(in: 1...100)
        target.text = "\(targetValue)"
        scoreLable.text = "\(score)"
        roundLable.text = "\(round)"
    }

}

