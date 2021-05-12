//
//  HomeTableViewCell.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 29/04/21.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
 /*   @IBAction func homeButton1() {
        let alert = UIAlertController(title: "Simpan Jurnal?", message: "Anda tidak bisa mengubah isi jurnal ini setelah menyimpan", preferredStyle: .alert)
        
        //        batal button
        alert.addAction(UIAlertAction(title: "Batal", style: .cancel, handler: {action in
            print("tapped Batal")
        }))
        
        //        hapus button
        alert.addAction(UIAlertAction(title: "Simpan", style: .default, handler: {action in
            self.insertData()
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }

*/
    
}
