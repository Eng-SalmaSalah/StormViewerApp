//
//  ViewController.swift
//  StormViewerApp
//
//  Created by Salma Salah on 2/4/20.
//  Copyright © 2020 Salma Salah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var picturesNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath! // here force unwrap is safe because any ios app has resourcePath
        
        let images = try! fileManager.contentsOfDirectory(atPath: path) // her force try i safe because i am sure that path exists
        
        for image in images{
            if image.hasPrefix("nssl"){
                picturesNames.append(image)
            }
        }
        
        print(picturesNames)
    }
}

