//
//  UISideMenuViewController.swift
//  Fenway Garden Society
//
//  Created by Jason Lu on 11/21/16.
//  Copyright © 2016 BU Global App Initiative. All rights reserved.
//

// Freely using: https://cocoapods.org/pods/SideMenu

// Error: not used with cocoapods yet: may need to install some cocoapods

// importing the menu library 
import SideMenu
import UIKit

class UISideMenuViewController: UINavigationController {

    override func viewDidLoad() {
        // Define the menus
        let menuLeftNavigationController = UISideMenuNavigationController()
        menuLeftNavigationController.leftSide = true
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration of it here like setting its viewControllers.
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        let menuRightNavigationController = UISideMenuNavigationController()
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration of it here like setting its viewControllers.
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        super.viewDidLoad()
        
        // additional button coding
        presentViewController(SideMenuManager.menuLeftNavigationController!,animated: true, completion: nil)

        // Do any additional setup after loading the view.
        
        // presentation mode of the menu
        // menuSlideInt: Menu slides over existing view
        // viewSlideOut: The existing view slides out to reveal the menu 
        // viewSlideInOut:
        // open var menuPresentMode : MenuPresentMode = .viewSlideOut
        // 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
