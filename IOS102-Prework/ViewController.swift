//
//  ViewController.swift
//  IOS102-Prework
//
//  Created by DJC on 11/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var schoolNameTextfield: UITextField!
    @IBOutlet weak var yearSelector: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsLabel: UILabel!
    
    // Background
    let gradientLayer = CAGradientLayer()
    var topColor: Int = -1
    var bottomColor: Int = -1
    let myColors = [
        UIColor.black.cgColor,
        UIColor.blue.cgColor,
        UIColor.brown.cgColor,
        UIColor.cyan.cgColor,
        UIColor.darkGray.cgColor,
        UIColor.gray.cgColor,
        UIColor.green.cgColor,
        UIColor.lightGray.cgColor,
        UIColor.magenta.cgColor,
        UIColor.orange.cgColor,
        UIColor.purple.cgColor,
        UIColor.red.cgColor,
        UIColor.white.cgColor,
        UIColor.yellow.cgColor
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPetsLabel.text = Int(numberOfPetsStepper.value).description
        morePetsLabel.text = morePetsSwitch.isOn.description
        gradientLayer.frame = self.view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    @IBAction func numberOfPetsStepper(_ sender: Any) {
        numberOfPetsLabel.text = Int(numberOfPetsStepper.value).description
    }
    
    @IBAction func morePetsSwitch(_ sender: Any) {
        morePetsLabel.text = morePetsSwitch.isOn.description
    }
    
    @IBAction func introduceYourselfButton(_ sender: Any) {
        let first = firstNameTextfield.text ?? "Jane"
        let last = lastNameTextfield.text ?? "No Last"
        let school = schoolNameTextfield.text ?? "some university"
        let year = yearSelector.titleForSegment(at: yearSelector.selectedSegmentIndex) ?? "0"
        var numOfPets: String {
            if numberOfPetsLabel.text == "1" {
                return "1 pet"
            }
            else {
                return "\(numberOfPetsLabel.text ?? "0") pets"
            }
        }
        var wantsMorePets: String {
            if morePetsSwitch.isOn {
                return "I would like more pets"
            }
            else {
                return "I do not want more pets"
            }
        }
        
        print(first.description)
        let message = "Hi! My name is \(first) \(last), and I study at \(school) in my \(year) year. I have \(numOfPets). In the future, \(wantsMorePets)."
        let alertController = UIAlertController(title: "My Introduction", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func changeBackground(_ sender: Any) {
        repeat {
            topColor = Int.random(in: 0..<myColors.count)
            bottomColor = Int.random(in: 0..<myColors.count)
        } while (topColor == bottomColor)
        gradientLayer.colors = [myColors[topColor], myColors[bottomColor]]
    }
    
}
