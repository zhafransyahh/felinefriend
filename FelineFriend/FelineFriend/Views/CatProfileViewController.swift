//
//  CatProfileViewController.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 29/04/21.
//

import Foundation
import UIKit

var profileInput = Profile(title: ["Age", "Sex", "Breed"], userInput: ["","",""])

class CatProfileViewController: UIViewController {
    
    @IBOutlet var catProfileImage: UIImageView!
    @IBOutlet var catProfileTableView: UITableView!
    @IBOutlet var catProfileNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catProfileImage.layer.cornerRadius = catProfileImage.frame.width / 2
        
        catProfileTableView.delegate = self
        catProfileTableView.dataSource = self
        
       let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: catProfileNameTextField.frame.height - 1, width: catProfileNameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        catProfileNameTextField.borderStyle = UITextField.BorderStyle.none
        catProfileNameTextField.layer.addSublayer(bottomLine)
 
    }
    
}

extension CatProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catProfileTableView.dequeueReusableCell(withIdentifier: "profileViewCell") as! CatProfileTableViewCell
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
