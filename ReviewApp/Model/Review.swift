//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation

//struct Review : Decodable {
//    let rate : Int
//    let review : String
//}
struct Course: Codable
{
    let id: Int
    let name: String
    let number_of_lessons: Int
    let comment : String
    
    init(id1: Int, name1:String, number_of_lessons1: Int, comment1: String) {
        self.id = id1
        self.name = name1
        self.number_of_lessons = number_of_lessons1
        self.comment = comment1
    }
}
