//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation
import RealmSwift
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

class Item: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = UUID().uuidString
    @objc dynamic var comment: String = ""
    @objc dynamic var rate: Int = 0
    
    func addNew(course : Course){
        var cat = Item()
                 let realm = try! Realm()
        let counter = realm.objects(Item.self).count
//        var myvalue = realm.objects(Item).map{$0.id}.maxElement() ?? 0
        var myvalue = counter + 1
        cat.id = myvalue
        cat.name = course.name
        cat.comment = course.comment
        cat.rate = course.number_of_lessons
        
                try! realm.write{
                    realm.add(cat)
                }
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

//class ReviewRealms: Object {
//    dynamic var id: Int = 0
//    dynamic var name: String = ""
//    dynamic var number_of_lessons: Int = 0
//    dynamic var comment : String = ""
//
//    func insertOrUpdate(news: Course) {
//        let realm = try! Realm()
//        try! realm.write({
//            let rRealm = ReviewRealms()
//            rRealm.id = news.id
//            rRealm.name = news.name
//            rRealm.number_of_lessons = news.number_of_lessons
//            rRealm.comment = news.comment
//            realm.add(rRealm)
//            })
//    }
//}
