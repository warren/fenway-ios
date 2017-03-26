//
//  PageItemController.swift
//  Fenway Garden Society
//
//  Created by Natalie Pienkowska on 3/25/17.
//  Copyright © 2017 BU Global App Initiative. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    
    var itemIndex: Int = 0 // ***
    var imageName: String = ""{
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
        @IBOutlet var contentImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView!.image = UIImage(named: imageName)
    }
}
