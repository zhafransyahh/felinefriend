//
//  profileUserInput.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 03/05/21.
//

import Foundation
import UIKit

struct profileLabelTag {
    
    var title = "String"
    var input = "String"
    
}

let ageCell = profileLabelTag(title: "Age", input: "")
let genderCell = profileLabelTag(title: "Gender", input: "")
let breedCell = profileLabelTag(title: "Breed", input: "")

var titleCollection: [profileLabelTag] = [ageCell, genderCell, breedCell]

