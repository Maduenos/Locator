//
//  DetailsViewController.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class DetailsActivityViewController: UIActivityViewController {

    private let controller: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subViews = self.view.subviews
        for view in subViews {
            view.removeFromSuperview()
        }

        self.addChild(controller)
        self.view.addSubview(controller.view)
    }
    
    required init(controller: UIViewController) {
        self.controller = controller
        super.init(activityItems: [], applicationActivities: nil)
    }
    
    

}
