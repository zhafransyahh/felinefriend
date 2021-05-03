//
//  homeInput1.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 02/05/21.
//

import Foundation
import UIKit

struct homeInput {
    let title: String
    let image: UIImage
}

let homeInput1 = homeInput(title: "Feed Cat", image: #imageLiteral(resourceName: "FeedLogo"))
let homeInput2 = homeInput(title: "Give Cat a Bath", image: #imageLiteral(resourceName: "giveBathLogo"))
let homeInput3 = homeInput(title: "Change Cat Litter Box", image: #imageLiteral(resourceName: "litterLogo"))


var homeInputCollection: [homeInput] = [homeInput1, homeInput2, homeInput3]

