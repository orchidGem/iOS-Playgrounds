//
//  GoogleMapViewController.swift
//  googlemapPractice
//
//  Created by Laura Evans on 1/2/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapViewController: UIViewController, GMSMapViewDelegate {
    
    // Define variables
    let coordinates: [MapCoordinates] = [
        MapCoordinates(latitude: 32.124293, longitude: 34.827944, title: "title 1", snippet: "snippet 1"),
        MapCoordinates(latitude: 32.126917, longitude: 34.829079, title: "title 1", snippet: "snippet 1")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create mapview
        GMSServices.provideAPIKey(
            "AIzaSyD8eFtKm_Wd5GtAAyNVb6jWr9G2xWXgF4w"
        )
        let camera = GMSCameraPosition.camera(withLatitude: coordinates[0].latitude, longitude: coordinates[0].longitude, zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect.zero,camera: camera)
        mapView.delegate = self
        view = mapView
        
        // Create coordinates
        for coordinate in coordinates {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//            marker.title = coordinate.title
//            marker.snippet = coordinate.snippet
            marker.map = mapView
        }
        
        
        
    }
    
    //MARK: MapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("taptap")
        return true
        }

}
