//
//  DetailsParentViewController.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let topDrag = TopDrag()
    var selectedPlace : Result!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        addElements()
    }
    
    func addElements () {
        view.addSubview(topDrag)
        view.addSubview(DetailsCollectionView(selectedPlace))
    }

}
