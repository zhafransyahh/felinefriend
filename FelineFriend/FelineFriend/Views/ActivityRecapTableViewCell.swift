//
//  ActivityRecapTableViewCell.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 04/05/21.
//

import UIKit

class ActivityRecapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityRecapLabel: UILabel!
    @IBOutlet weak var activityRecapDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
