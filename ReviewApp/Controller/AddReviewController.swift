
//
//  Review.swift
//  ReviewApp
//
//  Created by Adila on 7/29/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//


import UIKit
import SwiftUI

class AddReviewController: UIViewController, UITextFieldDelegate {
    
    //        private var courseViewModel = CourseViewModel()
    //    let cellId = "cellId"
    
    var name : String = ""
    var review : String = ""
    var nameField = UITextField()
    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside ADD NEW ReviewController")
        setupNavBar()
        setupEntry()
    }
    
//    fileprivate func UpdateData() {
//        Service.shared.updateJson()
//    }
    
    @objc func addTapped (){
        let data1 = self.nameField.text ?? "Empty String"
        let data2 = self.myTextField.text ?? "Empty String"
        var course = Course(id1: 4, name1: data1, number_of_lessons1: 4, comment1: data2)
        Service.shared.updateJson(course: course)
        self.navigationController?.popToRootViewController(animated: true)
        
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
    
    
    func setupEntry(){
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 250)), rating: 5, color: .white, starRounding: .roundToHalfStar)
        starRatingView.rating = Float(5.0)
        starRatingView.starColor = .blue
        view.addSubview(starRatingView)
        
        starRatingView.centerX(inView: view)
        starRatingView.isUserInteractionEnabled = true
        starRatingView.anchor(top:view.safeAreaLayoutGuide.topAnchor,paddingTop: 20)
        view.backgroundColor = .white
        
        self.nameField = UITextField(frame: CGRect(x: 0, y: 0, width: 100.00, height: 100.00))
//        nameField.center = view.center
        nameField.delegate = self
        self.view.addSubview(nameField)
        self.nameField.anchor(top: starRatingView.bottomAnchor, paddingTop: 10, paddingLeft: 10,paddingRight: 10)
        self.nameField.centerX(inView: view)
        //        myTextField.centerY(inView: view)
        self.nameField.placeholder = "Enter CRN "
        self.nameField.borderStyle = UITextField.BorderStyle.line
        self.nameField.backgroundColor = UIColor.white
        self.nameField.textColor = UIColor.black
        
        self.myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100.00, height: 100.00))
        self.myTextField.delegate = self
        self.myTextField.center = view.center
        self.view.addSubview(myTextField)
        self.myTextField.anchor(top: nameField.bottomAnchor, paddingTop: 10, paddingLeft: 10,paddingRight: 10)
        self.myTextField.centerX(inView: view)
        //        myTextField.centerY(inView: view)
        self.myTextField.placeholder = "Enter Your Review Here ... "
        self.myTextField.borderStyle = UITextField.BorderStyle.line
        self.myTextField.backgroundColor = UIColor.white
        self.myTextField.textColor = UIColor.black
        
    }
    
}


extension ViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }

}
