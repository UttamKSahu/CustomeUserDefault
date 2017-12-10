//
//  UKSCustomeUserDefault.swift
//  CustomeUserDefault
//
//  Created by UTTAM on 10/12/17.
//  Copyright © 2017 UTTAM. All rights reserved.
//

import Foundation

/*
 * UKSDefaultManager  is singleton class
 * It has ability to create the plist file in document directory
 * Load the data from plist
 * Save data in plist
 * Retrive saved data form plist
 * Remove all/single data from plist
 */

class UKSDefaultManager {
    
    private static var model = NSMutableDictionary()
    static var filePath: String!
    static var shared = UKSDefaultManager()
    
    // private init method is restricting to create the instance of this class
    private init() {}
    
    // this function create the default.plist in documet directory
    // set the file path in filePath variable
    func setup() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths[0] as! String
        UKSDefaultManager.filePath = documentDirectory.appending("/default.plist")
        loadConfiguration()
    }
    
    /********************
     // This function is responsible for getting the value for respective key from Configuration plist
     ********************/
    func getValue(key: String) ->Any? {
        return UKSDefaultManager.model[key] as Any
    }
    
    /********************
     // This function is responsible for returnig all the data in default plist
     ********************/
    func getDefaultData()->NSMutableDictionary {
        return UKSDefaultManager.model
    }
    
    /********************
     // This function is responsible for setting the value for respective key in plist
     ********************/
    func set(value: Any, key: String) {
        UKSDefaultManager.model.setValue(value, forKey: key)
        saveData()
    }
    
    /********************
     // this func takes json and and store it in plist as key value pair
     // This function is responsible for setting the value for respective key in plist
     ********************/
    /* func set(json: [String:Any] ) {
     let allkey = json.keys
     for key in allkey {
     if let value = json[key] {
     UKSDefaultManager.shared.set(value: value , key: key)
     }
     }
     }
     */
    
    /********************
     // This function is responsible for removing  the value for respective key from plist
     ********************/
    func removeValueForKey(key: String){
        UKSDefaultManager.model.removeObject(forKey: key)
        saveData()
    }
    
    /********************
     // This function will clear all the data from plist permanently
     ********************/
    func clear () {
        UKSDefaultManager.model.removeAllObjects()
        saveData()
    }
    
    /********************
     // This function is responsible for loading the default plist data to model dictictionary
     ********************/
    func loadConfiguration() {
        if (UKSDefaultManager.filePath != nil) {
            let configResult = NSMutableDictionary(contentsOfFile: UKSDefaultManager.filePath!)
            if((configResult) != nil){
                UKSDefaultManager.model = configResult!
                print("FILE LOADED SUCCESSFULLY")
            }else{
                print("ERROR WHILE LOADING FILE")
            }
        }else{
            print("ERROR WHILE LOADING FILE")
        }
    }
    
    /********************
     // This method is responsible for writing the data to  plist
     ********************/
    func saveData() {
        UKSDefaultManager.model.write(toFile: UKSDefaultManager.filePath!, atomically: true)
    }
}
