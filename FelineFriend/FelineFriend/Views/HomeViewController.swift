//
//  ViewController.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 28/04/21.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadsetup()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        
    
    }
    
    
    
    func feedNotif() {
        //Ask Permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        
        
        //Create Notification Content
        let content = UNMutableNotificationContent()
        content.title = "I'm Hungry!"
        content.body = "Would you feed me, please? 🥺"
        content.sound = UNNotificationSound.default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 21600, repeats: true)
        
        //Create Request
        
        let identifier  = "Local Notification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        
        //Register the Request
        center.add(request) { (error) in
            
        }
    }
    
    func litterNotif() {
        //Ask Permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        
        
        //Create Notification Content
        let content = UNMutableNotificationContent()
        content.title = "Uh-Oh, it's getting smelly here! 😷"
        content.body = "Can you help me clean my litter box?"
        content.sound = UNNotificationSound.default
        
//        172800
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 172800, repeats: true)
        
        //Create Request
        
        let identifier  = "Local Notification 2"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        
        //Register the Request
        center.add(request) { (error) in
            
        }
    }
    
    func bathNotif() {
        //Ask Permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        
        
        //Create Notification Content
        let content = UNMutableNotificationContent()
        content.title = "It's SHOWER TIME! 🧽"
        content.body = "Waiting for you to give me a bath, hooman!"
        content.sound = UNNotificationSound.default
        
        // Specify Trigger
        _ = Date().addingTimeInterval(15)
        
//        604800
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        
        //Create Request
        
        let identifier  = "Local Notification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        
        //Register the Request
        center.add(request) { (error) in
            
        }
    }
    
    // -------------------- SETUP
    
    func loadsetup(){
        roundButton()
        feedNotif()
        litterNotif()
        bathNotif()
    }
    
    // -------------------- SETUP
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
       navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    

    
    func roundButton(){
        calendarButton.layer.cornerRadius = 5
    }
    
    
//    Insert Core Data
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func insertData(index: Int){
        let entry = HomeInput(context: self.context)
        entry.title = homeInputCollection[index].title
        entry.date = Date()
        entry.image = homeInputCollection[index].image
        
        do {
            try context.save()
        } catch  {
            
        }
    }
    
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Log successful!", message: "Your activity is logged.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
//        Insert data didalam alert
//        Ketika di klik bakalan melakukan action dibawah ini

        insertData(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "customViewCell") as! HomeTableViewCell
        
        cell.cellImage.image = defaultHomeInputCollection[indexPath.row].image
        cell.topLabel.text = defaultHomeInputCollection[indexPath.row].title
        cell.bottomLabel.text = defaultHomeInputCollection[indexPath.row].subtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    
}

