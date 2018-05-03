//
//  Meal.swift
//  FoodTracker
//
//  Created by Marc Yang on 2018-05-03.
//  Copyright © 2018 Marc Yang. All rights reserved.
//

import UIKit


class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    //MARK: Initialization
    
    // a meal has a name and rating
    // but the photo is optional
    // your initializer returns an optional Meal? object.
    /*
        A guard statement declares
        a condition that must be true
        in order for the code
        after the guard statement to be executed.
     */
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    
    

}




