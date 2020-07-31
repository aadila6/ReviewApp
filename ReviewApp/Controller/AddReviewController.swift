
//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//


import UIKit

class AddReviewController: UIViewController {
    
//        private var courseViewModel = CourseViewModel()
    //    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside ADD NEW ReviewController")
        setupNavBar()
    }
    

    @objc  func addTapped (){
        //New review page should show up
        //        let newViewController = NewViewController()
        self.navigationController?.pushViewController(ReviewController(), animated: true)
        
    }
    fileprivate func setupNavBar() {
        navigationItem.title = "New Review"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha : 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
    
 

   
