//
//  ViewController.swift
//  FoodTracker
//
//  Created by Marc Yang on 2018-01-17.
//  Copyright © 2018 Marc Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    //MARK: Properties
    //Outlets let you refer to your interface elements in code
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    //A control (UIControl) is a subclass of UIView
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // make this class ViewController as UIText delegate
        nameTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    // delegate is an object that acts on behalf of,
    // or in coordination with, another object
    // The delegating object—in this case, the text field—keeps
    // a reference to the other object—the delegate—and at the appropriate time,
    // the delegating object sends a message to the delegate.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
        
    }
    
    
    //MARK: Actions
    //An action (or an action method) is a piece of code
    //that’s linked to an event that can occur in your app.
    
    /*
     param:
        sender: object that was responsible for 
                triggering the action
     
    */
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        
    }
    
    //Target-action design pattern
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
        
    }
    
    
    
    
    
    
    
}

