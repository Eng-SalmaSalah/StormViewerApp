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
    var titleToShow: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleToShow
        //to show title small in the pushed screen in the navigation controller
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareBtnTapped))
        //action is the sharing btn
        
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
    
    @objc func shareBtnTapped(){ //@objc is bec UIbarbuttonitem is an objective c method so it cannot see the swift code of shareBtntapped
        // guard let bec image is optional 
        guard let imageToShare = detailsImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("no image found")
            return
        }
        let activityVC = UIActivityViewController(activityItems:[imageToShare], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        //the line above tells the share view where to appear (what was tapped to view it) in case we use ipad it is important,without it app will crash
        present(activityVC,animated: true)
    }

}
