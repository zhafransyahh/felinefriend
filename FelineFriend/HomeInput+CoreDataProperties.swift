//
//  HomeInput+CoreDataProperties.swift
//  FelineFriend
//
//  Created by Rafi Zhafransyah on 02/05/21.
//
//

import Foundation
import CoreData
import UIKit


extension HomeInput {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HomeInput> {
        return NSFetchRequest<HomeInput>(entityName: "HomeInput")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var image: UIImage?

}

extension HomeInput : Identifiable {

}
