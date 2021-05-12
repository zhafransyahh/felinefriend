//
//  CatProfileViewController.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 29/04/21.
//

import Foundation
import UIKit



class CatProfileViewController: UIViewController {
    
    @IBOutlet var catProfileImage: UIImageView!
    @IBOutlet var catProfileTableView: UITableView!
    @IBOutlet var catProfileNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    Reload Page when load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        catProfileImage.layer.cornerRadius = catProfileImage.frame.width / 2
        
        catProfileTableView.delegate = self
        catProfileTableView.dataSource = self
        
        //Decode Image from User Defaults
        let data = UserDefaults.standard.object(forKey: "SavedImage") as! NSData
        catProfileImage.image = UIImage(data: data as Data)
        let defaults = UserDefaults.standard
        catProfileNameLabel.text = defaults.value(forKey: "Name") as? String
 
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        catProfileTableView.reloadData()
//    }
//
    
    @IBAction func unwindToCatProfile(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        self.viewWillAppear(true)
        catProfileTableView.reloadData()
        // Use data from the view controller which initiated the unwind segue
    }
}

extension CatProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catProfileTableView.dequeueReusableCell(withIdentifier: "profileViewCell") as! CatProfileTableViewCell
        
        var arr: [String] = []
        let defaults = UserDefaults.standard
        let ageText = defaults.string(forKey: "Age")
        arr.append(ageText!)
        let genderText = defaults.string(forKey: "Gender")
        arr.append(genderText ?? "")
        let breedText = defaults.string(forKey: "Breed")
        arr.append(breedText!)
        
        cell.profileLabel.text = titleCollection[indexPath.row].title
        cell.inputLabel.text = arr[indexPath.row]
        
        
        
//        cell.inputLabel[0].text =
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
