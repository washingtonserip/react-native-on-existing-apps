//
//  ViewController.swift
//  ReactNativeOnExistingApps
//
//  Created by Washington Pires on 08/12/19.
//  Copyright © 2019 Washington Pires. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     @IBAction func ReactButtonTapped(sender : UIButton) {
        //Code to get the url of the main.jsbundle in the project.
        guard let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else { return }
        
        //The data is used as initialProperties to React Native App.
        let data:NSDictionary = [:]; //We can use this parameter to pass the data to the React native App from the Native App.
        
        //The RCTRootView is a native view used to host React-managed views within the app. Can be used just like any ordinary UIView.
        let rootView = RCTRootView(
            bundleURL: jsBundleLocation,
            moduleName: "ReactNativeOnExistingApps",
            initialProperties: data as [NSObject : AnyObject],
            launchOptions: nil
        )
        
        let viewController = UIViewController()

        viewController.view = rootView
        
        self.present(viewController, animated: true, completion: nil)

    }

}

