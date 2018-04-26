//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Marc Yang on 2018-02-10.
//  Copyright © 2018 Marc Yang. All rights reserved.
//

import UIKit


//This lets Interface Builder instantiate and draw a copy of your control directly in the canvas. 
// The interface now has a live copy of the Controller

/*
 
 Accessibility label:
    - A short, localized word or phrase that succinctly describes the control or view, but does not identify the element’s type.
 
 Accessibility value:
    - The current value of an element, when the value is not represented by the label. For example, the label for a slider might be “Speed,” but its current value might be “50%.”
 
 Accessibility hint: 
    - A brief, localized phrase that describes the results of an action on an element. Examples are “Adds a title” or “Opens the shopping list.”
 
 */

@IBDesignable class RatingControl: UIStackView {
    
    // a custom view subclass of UIView.
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    
    // rating score
    var rating = 0 {
        // property observer
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    // the size of your buttons and the number of buttons in your control
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        
        //property observer: observes and responds to changes in a property’s value
        didSet {
            setupButtons()
        }
        
        
    }
    @IBInspectable var countMyStar: Int = 5 {
        
        //property observer
        didSet {
            setupButtons()
        }
        
    }
    
    
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        // implement the rating action
        // indexOf(_:) method attempts to find the selected button in the array of buttons 
        // and to return the index at which it was found
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            self.rating = 0
        } else {
            // Otherwise set the rating to the selected star
            self.rating = selectedRating
        }
    }
    
    
    //MARK: Private Methods
    
    private func setupButtons() {
        
        // Clear any existing buttons 
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        // These lines load the star images from the assets catalog.
        // For the images to load properly in Interface Builder, 
        // you must explicitly specify the catalog’s bundle.
        let bundle = Bundle(for: type(of: self))
        // his means that the app can load the images using the shorter UIImage(named:)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        
        for index in 0..<countMyStar {
            
            
            
            // Create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            // filledStar has a state selected
            button.setImage(filledStar, for: .selected)
            //If you programmatically set the button as selected, 
            //it will change from the empty star to the filled star.
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            // Buttons have five different states: normal, highlighted, focused, selected, and disabled.
            
            
            // Add constraints
            
            // when you are using Auto Layout, you want to replace these autogenerated constraints with your own.
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: self.starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: self.starSize.width).isActive = true
            
            
            // Set the accessibility label (VoiceOver)
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            
            // Setup the button action
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // target-action pattern
            // target: self --> RatingControl object
            // #selector expression returns the Selector value for the provided method
            // selector is an opaque value that identifies the method
            // UIControlEvents option set defines a number of events that controls (button) can respond to
            // - buttons respond to the .touchUpInside event
            
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            self.ratingButtons.append(button)
        
        } // end of countMyStar
        
        updateButtonSelectionStates()
        
        
    }
    
    // update the button’s appearance
    private func updateButtonSelectionStates() {
        
        
        
        
        for (index, button) in ratingButtons.enumerated() {
            
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // (VoiceOver)
            // check whether the button is the currently selected button
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // (VoiceOver)
            // calculate the value based on the control’s rating.
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // (VoiceOver)
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            
        }
    
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    
    
    
}
