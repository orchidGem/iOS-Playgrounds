//
//  TestServiceViewController.swift
//  googlemapPractice
//
//  Created by Laura Evans on 1/9/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit

class TestServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GooglePlacesService.sharedInstance.getPlaces(latitude: "123", longitude: "123", completionHandler: {myString, success in
        
            print("My String: \(myString)")
            print("Success: \(success)")
            
        })
    }



}
