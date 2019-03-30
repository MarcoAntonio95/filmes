//
//  ViewController.swift
//  filmes
//
//  Created by PUCPR on 29/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var tittleTF: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlBase = "https://api.themoviedb.org/3/movie/550?api_key="
        let key = "aaeb771d0f949923e8e184500fd77823"
        let url = "\(urlBase)\(key)"
        let baseImage = "https://image.tmdb.org/t/p/w500"
        
        Alamofire.request(url).responseJSON { (response) in print(response.result.value)
        
            if response.result.isSuccess{
            
            let json = JSON(response.result.value)
                self.tittleTF.text = json["title"].stringValue
                print(json["title"])
                print(json["production_companies"][0]["name"])
                let imagePath = "\(baseImage)\(json["poster_path"].stringValue)"
       
                let urlImage = URL(string: imagePath)
                
                var bytes = try? Data(contentsOf: urlImage!)
                
                let image = UIImage(data: bytes!)
                
                self.imageIV.image = image
                
            }
     
        }
    }


}

