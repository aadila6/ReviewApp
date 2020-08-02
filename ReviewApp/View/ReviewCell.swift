//
//  ReviewCell.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation
import UIKit

class CourseCell: UITableViewCell {
//    var rateStar : Float
    var courseViewModel: CourseViewModel! {
        didSet {
            textLabel?.text = courseViewModel.name
            detailTextLabel?.text = courseViewModel.detailTextString
            accessoryType = courseViewModel.accessoryType
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .black
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
//        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 150, height: 150)), rating: 3.5, color: UIColor.systemOrange, starRounding: .roundToHalfStar)
//        starRatingView.center = center
//        starRatingView.rating = Float(courseViewModel.rate)
//        starRatingView.rating = Float(courseViewModel.rate ?? 5.0 )
//        addSubview(starRatingView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
