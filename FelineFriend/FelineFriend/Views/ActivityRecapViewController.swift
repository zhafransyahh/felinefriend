//
//  ActivityRecapViewController.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 03/05/21.
//

import UIKit
import CoreData


class ActivityRecapViewController: UIViewController {
    
    @IBOutlet weak var ActivityRecapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        ActivityRecapTableView.delegate = self
        ActivityRecapTableView.dataSource = self
    }
    // Do any additional setup after loading the view.
}

var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

var arrayData: [HomeInput] = []



func getData() {
    do {
        //        arrayData = try context.fetch(HomeInput.fetchRequest())
        // create request
        let request = HomeInput.fetchRequest() as NSFetchRequest<HomeInput>
        
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        // fetch item
        arrayData = try context.fetch(request)
    } catch  {
        
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



extension ActivityRecapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recapCellID") as! ActivityRecapTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let thisData: HomeInput!
        thisData = arrayData[indexPath.row]
        
        //        if let date = HomeInput?
        
        cell.activityRecapLabel.text = thisData.title
        cell.activityImageView.image = thisData.image
        cell.activityRecapDateLabel.text = dateFormatter.string(from: thisData.date!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}



