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
        
        //Ask Permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        //Create Notification Content
        let content = UNMutableNotificationContent()
        content.title = "Hey i am a notif"
        content.body = "Look at me!"
        
        // Specify Trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, . minute,. second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //Create Request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        
        //Register the Request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
       navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    
    func loadsetup(){
        roundButton()
    }
    
    func roundButton(){
        calendarButton.layer.cornerRadius = 5
    }
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func insertData(index: Int){
        let entry = HomeInput(context: self.context)
        entry.title = homeInputCollection[index].title
        entry.date = Date()
        entry.image = homeInputCollection[index].image
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        Insert data didalam alert
//        Ketika di klik bakalan melakukan action dibawah ini

        //        insertData(index: indexPath.row)
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

