//
//  ViewController.swift
//  StormViewerApp
//
//  Created by Salma Salah on 2/4/20.
//  Copyright © 2020 Salma Salah. All rights reserved.
//

import UIKit

class PicturesViewController: UITableViewController {
    
    var picturesNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        //to show large title for the first screen in navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "suggest app", style: .plain, target: self, action: #selector(suggestApp))
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath! // here force unwrap is safe because any ios app has resourcePath
        
        let images = try! fileManager.contentsOfDirectory(atPath: path) // her force try i safe because i am sure that path exists
        
        for image in images{
            if image.hasPrefix("nssl"){
                picturesNames.append(image)
            }
        }
        picturesNames = picturesNames.sorted() //to sort the array of pics names
        print(picturesNames)
    }
    
    //table view methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return picturesNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
        cell.textLabel?.text = picturesNames[indexPath.row];
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsVC = storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController{
            detailsVC.selectedImage = picturesNames[indexPath.row]
            detailsVC.titleToShow = "Picture \(indexPath.row + 1) of \(picturesNames.count)"
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    @objc func suggestApp(){
        let firstActivityItem = "Try it!"
        let secondActivityItem : NSURL = NSURL(string: "https://github.com/Eng-SalmaSalah/StormViewerApp")!
        let activityVC = UIActivityViewController(activityItems: [firstActivityItem,secondActivityItem], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC,animated: true)
    }
}

