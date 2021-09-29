//
//  PTApplication.swift
//  PracticalTest
//
//  Created by Archi Thakkar on 29/09/21.
//

import UIKit

class PTApplication {
    
    static let shared = PTApplication()
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var jsonArray : [Any] = []
    
    func prepareView() {
        PTApplication.appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let photoGridVC = UIStoryboard.main.get(ViewController.self)!
        let navigationVC = UINavigationController(rootViewController: photoGridVC)
        PTApplication.appDelegate.window?.rootViewController = navigationVC
        PTApplication.appDelegate.window?.makeKeyAndVisible()
        loadJsonData()
    }
    
    func loadJsonData() {
        if let path = Bundle.main.path(forResource: "joblist", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                PTApplication.shared.jsonArray = jsonResult as! [Any]
                print(PTApplication.shared.jsonArray)
            } catch {
                // handle error
            }
        }
    }
}
