//
//  ViewController.swift
//  Weather
//
//  Created by Lucy on 19/08/2020.
//

import UIKit
//adding UITextFieldDelegate for managing the editing of text in a text field
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var weatherPicture: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // the searchTextField is sending an info to ViewController about the user changes
        searchTextField.delegate = self
    }

    
    @IBAction func searchPressed(_ sender: UIButton) {
        //dismiss the keyboard
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    
    //code for action after the return button is pressed by user on the keyboard (the button "go")
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    
    //if the user doesnt type anything (empty string) in the textField and presses search button, applies to every text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Enter the city"
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        //clears the textField after user presses search button
        searchTextField.text = ""
    }

}

