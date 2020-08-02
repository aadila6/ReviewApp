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
    let star : UIView
    
    // Dependency Injection (DI)
    init(course: Course) {
        self.name = course.name
        self.rate = Float(course.number_of_lessons)
        self.detailTextString = course.comment
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 150)), rating: 3.5, color: .white, starRounding: .roundToHalfStar)
        starRatingView.rating = Float(course.number_of_lessons)
        starRatingView.starColor = .blue
//        starRatingView.starRounding = true
//        starRatingView.isUserInteractionEnabled = true
//        addSubview(starRatingView)
        starRatingView.anchor(paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        self.star = starRatingView
        self.accessoryType = .detailDisclosureButton
       
        
    }
}
