//
//  Service.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation


class Service: NSObject {
    static let shared = Service()
    
    func fetchCourses(completion: @escaping ([Course]?, Error?) -> ()) {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "Data",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {

                do {
                    let courses = try JSONDecoder().decode([Course].self, from: jsonData)
                                    DispatchQueue.main.async {
                                        completion(courses, nil)
                                    }
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }
        } catch {
            print(error)
        }
    }
}





