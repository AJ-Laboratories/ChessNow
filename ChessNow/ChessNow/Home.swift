//
//  Home.swift
//  ChessNow
//
//  Created by Alexander Panayotov on 22/03/15.
//  Copyright (c) 2015 Johannes Berge & Alexander Panayotov. All rights reserved.
//

import UIKit

class Home: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // tab-bar and navigation bar
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.BlackTranslucent
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "CaviarDreams", size: 18)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
       
        self.tabBarController?.tabBar.tintColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.barTintColor = UIColor.blackColor()
        let appearance = UITabBarItem.appearance()
        let attributes = [NSFontAttributeName:UIFont(name: "CaviarDreams", size: 20)!]
    }
    
    // MARK: - Setup-functions 🔍
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
}
