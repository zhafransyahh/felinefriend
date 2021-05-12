//
//  EditProfileViewController.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 03/05/21.
//

import UIKit
import Photos

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var catProfileTextField: UITextField!
    @IBOutlet weak var catProfileEditImage: UIImageView!
    @IBOutlet weak var catProfileAge: UITextField!
    @IBOutlet weak var catProfileBreed: UITextField!
    @IBOutlet weak var catProfileGender: UISegmentedControl!
    
    var imagePickerController = UIImagePickerController()
    
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: catProfileTextField.frame.height - 1, width: catProfileTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        catProfileTextField.borderStyle = UITextField.BorderStyle.none
        catProfileTextField.layer.addSublayer(bottomLine)
        
        catProfileEditImage.layer.cornerRadius = catProfileEditImage.frame.width / 2
        
        imagePickerController.delegate = self
        checkPermissions()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        let data = UserDefaults.standard.object(forKey: "SavedImage") as! NSData
        catProfileEditImage.image = UIImage(data: data as Data)
        let defaults = UserDefaults.standard
        catProfileTextField.text = defaults.value(forKey: "Name") as? String
        let ageText = defaults.string(forKey: "Age")
        catProfileAge.text = ageText
        
        let genderText = defaults.string(forKey: "Gender")
        catProfileGender.selectedSegmentIndex = Int(genderText ?? "") ?? 0
        
        let breedText = defaults.string(forKey: "Breed")
        catProfileBreed.text = breedText
//
        
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else{
            return
        }
        self.view.frame.origin.y = 0 - keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    
    
    
    @IBAction func cancelActionButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedCameraButton(_ sender: Any){
        //        Camera Function
        //        let picker = UIImagePickerController()
        //        picker.sourceType = .camera
        //        picker.allowsEditing = true
        //        picker.delegate = self
        //        present(picker, animated: true)
        
        //        Library Function
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveActionButton(_ sender: UIBarButtonItem){
        // User defaults save dalem sini
        defaults.setValue(catProfileTextField.text, forKey: "Name")
        defaults.setValue(catProfileAge.text, forKey: "Age")
        defaults.setValue(catProfileBreed.text, forKey: "Breed")
        //Encode
        let image = catProfileEditImage.image
        let imageData:NSData = image?.jpegData(compressionQuality: 1) as! NSData
        
        //Save to user defaults
        defaults.setValue(imageData, forKey: "SavedImage")
        

        let index = catProfileGender.selectedSegmentIndex
        defaults.setValue(catProfileGender.titleForSegment(at: index), forKey: "Gender")
        
        self.performSegue(withIdentifier: "unwindID", sender: self)
        
    }
    
    func checkPermissions(){
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({
                (status: PHAuthorizationStatus) -> Void in ()
            })
        }
        
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            
        }else{
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    
    func requestAuthorizationHandler(status: PHAuthorizationStatus){
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
            print("Access Granted")
        }else{
            print("Access Denied")
        }
    }
    
    
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //
    //       catProfileEditImage?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    //        picker.dismiss(animated: true, completion: nil)
    //
    //    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        catProfileEditImage?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
}
