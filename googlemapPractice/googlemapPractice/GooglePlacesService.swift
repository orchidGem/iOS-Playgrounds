//
//  GooglePlacesService.swift
//  googlemapPractice
//
//  Created by Laura Evans on 1/9/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import Foundation

class GooglePlacesService {
    static let sharedInstance = GooglePlacesService()
    
    func getPlaces(latitude: String, longitude: String, completionHandler:(String, Bool) -> ()) {
    
        completionHandler("this worked", true)
    }
}
