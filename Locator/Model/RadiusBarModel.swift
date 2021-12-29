//
//  RadiusBarModel.swift
//  Locator
//
//  Created by Mahammad on 29.12.2021.
//

import UIKit
import Combine

class RadiusBarModel {
    
    var barTapped = PassthroughSubject<Void, Never>()
    var radiusTapped = PassthroughSubject<Void, Never>()
    
    func setTapOnBarDone (button: UIBarButtonItem) {
        button.target = self
        button.action = #selector(notifyBarDoneTapped)
    }
    
    @objc func notifyBarDoneTapped () {
        barTapped.send()
    }
    
    func setTapOnRadiusButton (button: UIView) {
        let searchTap = UITapGestureRecognizer(target: self, action: #selector(notifyRadiusTapped))
        
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(searchTap)
    }
    
    @objc func notifyRadiusTapped () {
        radiusTapped.send()
    }
    
}
