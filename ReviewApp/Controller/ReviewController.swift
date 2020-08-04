
//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//


import UIKit
import RealmSwift

class ReviewController: UITableViewController {
    
    var courseViewModels = [CourseViewModel]()
    let cellId = "cellId"
//    var realm : Realm
//    var realm: Realm = Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside ReviewController")
        let realm = try! Realm()
        print("REALM PATH: \(Realm.Configuration.defaultConfiguration.fileURL)")
        let listItems = realm.objects(Item.self)
        for item in listItems {
            print(item.name)
        }
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        let realm = try! Realm()
        let listItems = realm.objects(Item.self)
        self.courseViewModels = listItems.map({return CourseViewModel(course: $0)}) ?? []
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModels.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        let courseViewModel = courseViewModels[indexPath.row]
        cell.courseViewModel = courseViewModel
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 150, height: 150)), rating: 3.5, color: UIColor.systemOrange, starRounding: .roundToHalfStar)
        starRatingView.center = cell.center
        starRatingView.rating = Float(courseViewModel.rate)
        starRatingView.isUserInteractionEnabled = false
        cell.addSubview(starRatingView)
        starRatingView.anchor(top: cell.topAnchor,left: cell.textLabel?.rightAnchor, paddingTop: 15, paddingLeft: 30 )
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row ", indexPath.row)
        let courseViewModel = courseViewModels[indexPath.row]
        let titleString = "\(courseViewModel.name) (\(courseViewModel.rate)/5.0)"
        let alert = UIAlertController(title: titleString, message: courseViewModel.detailTextString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
    @objc func addTapped (){
        self.navigationController?.pushViewController(AddReviewController(), animated: true)
        
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
