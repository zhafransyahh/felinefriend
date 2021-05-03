//
//  defaultHomeInput.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 02/05/21.
//

import Foundation
import UIKit

struct defaultHomeInput{
    var title = "String"
    var subtitle = "String"
    var image: UIImage
    
}

let defaultHomeInput1 = defaultHomeInput(title: "Feed", subtitle: "Please feed me!", image: #imageLiteral(resourceName: "FeedLogo"))
let defaultHomeInput2 = defaultHomeInput(title: "Give Bath", subtitle: "You would love me more if i am clean!", image: #imageLiteral(resourceName: "giveBathLogo"))
let defaultHomeInput3 = defaultHomeInput(title: "Change Litter Box", subtitle: "I hope you don't smell anything!", image: #imageLiteral(resourceName: "litterLogo"))

var defaultHomeInputCollection: [defaultHomeInput] = [defaultHomeInput1, defaultHomeInput2, defaultHomeInput3]



