
//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//


import UIKit

class ReviewController: UITableViewController {
    
    var courseViewModels = [CourseViewModel]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside ReviewController")
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }

            self.courseViewModels = courses?.map({return CourseViewModel(course: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        let courseViewModel = courseViewModels[indexPath.row]
        cell.courseViewModel = courseViewModel
        return cell
    }
    
    fileprivate func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    @objc  func addTapped (){
        //New add new review page should show up
    }
    fileprivate func setupNavBar() {
        
        navigationItem.title = "Adila's Reviews"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha : 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
