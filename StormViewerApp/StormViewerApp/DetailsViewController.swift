//
//  DetailsViewController.swift
//  StormViewerApp
//
//  Created by Salma Salah on 2/4/20.
//  Copyright © 2020 Salma Salah. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsImageView: UIImageView!
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        //to show title small in the pushed screen in the navigation controller
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            detailsImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //to hide the upper bar that has the back button when tap on screen
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    


}
