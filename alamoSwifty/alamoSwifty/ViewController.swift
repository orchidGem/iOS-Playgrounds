//
//  ViewController.swift
//  alamoSwifty
//
//  Created by Laura Evans on 1/3/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var tracks = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.spotify.com/v1/search?q=adele&type=track").responseJSON { response in
            
            guard let alamoResponse = response.result.value else {
                print("error")
                return
            }
            
            let json = JSON(alamoResponse)
            
            guard let tracksJSON = json["tracks"]["items"].array else {
                print("error")
                return
            }
            
            for track in tracksJSON {
                let trackInfo = [
                    "name": track["name"].string!,
                    "href": track["href"].string!,
                ]
                
                self.tracks.append(trackInfo)
            }
            
            for track in self.tracks{
                print("Track Name: \(track["name"]!). Track href: \(track["href"]!)\n")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

