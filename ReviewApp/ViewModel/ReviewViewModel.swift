//
//  ReviewViewModel.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation
import UIKit

struct CourseViewModel {
    
    let name: String
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    let rate : Float
//    let star : UIView
    
    // Dependency Injection (DI)
    init(course: Item) {
        self.name = course.name
        self.rate = Float(course.rate)
        self.detailTextString = course.comment
        self.accessoryType = .detailDisclosureButton
       
        
    }
}
