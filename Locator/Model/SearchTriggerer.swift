//
//  SearchTriggerer.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit
import Combine

class SearchTriggerer {
    
    let textField: UITextField
    let searchIcon: UIImageView
    var isClicked = PassthroughSubject<Void, Never>()
    
    init (textField: UITextField, searchIcon: UIImageView) {
        self.textField = textField
        self.searchIcon = searchIcon
        
        setActionOnReturnButton()
        setActionOnSearchIcon()
    }
    
    func setActionOnReturnButton () {
        textField.addTarget(self, action: #selector(returnclicked), for: UIControl.Event.primaryActionTriggered)
    }
    
    func setActionOnSearchIcon () {
        let iconTap = UITapGestureRecognizer(target: self, action: #selector(returnclicked))
        
        searchIcon.isUserInteractionEnabled = true
        searchIcon.addGestureRecognizer(iconTap)
    }
    
    @objc func returnclicked () {
        isClicked.send()
    }
    
}
