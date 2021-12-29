//
//  TopDrag.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class TopDrag: UIView {
    
    func setConstraints () {
        guard let parent = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor, constant: 10).isActive = true
        heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    func setDesign () {
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        layer.cornerRadius = 3
    }
    
    func setConfigs () {
        tag = 1
    }
    
    override func didMoveToSuperview() {
        setConstraints()
    }
    
    init() {
        super.init(frame: .zero)
        
        setDesign()
        setConfigs()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
