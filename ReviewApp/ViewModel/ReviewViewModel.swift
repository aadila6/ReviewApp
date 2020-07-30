//
//  ReviewViewModel.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation

import Foundation
import UIKit

struct CourseViewModel {
    
    let name: String
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    
    // Dependency Injection (DI)
    init(course: Course) {
        self.name = course.name
        
        if course.number_of_lessons > 35 {
            detailTextString = "Lessons 30+ Check it Out!"
            accessoryType = .detailDisclosureButton
        } else {
            detailTextString = "Lessons: \(course.number_of_lessons)"
            accessoryType = .none
        }
    }
}
