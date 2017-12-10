//
//  ViewController.swift
//  CustomeUserDefault
//
//  Created by UTTAM on 10/12/17.
//  Copyright © 2017 UTTAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testCustomeDefault()
    }
    
    
    func testCustomeDefault() {
        
        // Setting the value for key -- By using function --> set(value: 10, key: "Test")
        // func set(value: Any , key: String) , accept value as "Any" data type and key as "String" data type
        //
        UKSDefaultManager.shared.set(value: 10, key: "Test")
        
        UKSDefaultManager.shared.set(value: true , key: "BoolTest")
        
        UKSDefaultManager.shared.set(value: "Uttam" , key: "name")
        
        // func getDefaultData , will return all data stored in plist
        let data = UKSDefaultManager.shared.getDefaultData()
        print("ALL Data :: \(data)")
        
        // Getting value for key -- By using function --> getValue(key: "name")
        // func getValue return optional type to handle nil
        
        if let value = UKSDefaultManager.shared.getValue(key: "Test") as? Int {
            print("GOT the value :: \(value)")
        }
        
        if let value = UKSDefaultManager.shared.getValue(key: "BoolTest") as? Bool {
            print("GOT BoolTest value :: \(value)")
        }
        
        if let value = UKSDefaultManager.shared.getValue(key: "name") as? String {
            print("GOT the value :: \(value)")
        }
        
        // func removeValueForKey , remove the value for respective value from plist permanently
        UKSDefaultManager.shared.removeValueForKey(key: "name")
        
        if let value = UKSDefaultManager.shared.getValue(key: "name") as? String {
            print("GOT the value :: \(value)")
        }
        
        // func "clear" useful to clear all the saved data from default plist  permanently
        UKSDefaultManager.shared.clear()
        
        if let value = UKSDefaultManager.shared.getValue(key: "Test") as? Int {
            print("GOT the value :: \(value)")
        }
        
        if let value = UKSDefaultManager.shared.getValue(key: "BoolTest") as? Bool {
            print("GOT the value :: \(value)")
        }
        
        if let value = UKSDefaultManager.shared.getValue(key: "name") as? String {
            print("GOT the value :: \(value)")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

