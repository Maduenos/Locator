//
//  DetailsButton.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class RadiusButton: UIView {
    
    var label: UILabel = UILabel()
    
    init () {
        super.init(frame: .zero)
        
        setDesign()
        addLabel()
        renameLabel()
    }
    
    override func didMoveToSuperview() {
        setConstraints()
        addLabelConstraints()
    }
    
    func addLabel () {
        label.textColor = .black
        label.textAlignment = .center
        
        addSubview(label)
    }
    
    func renameLabel (buttonText: String? = "Radius") {
        label.text = buttonText
    }
    
    func addLabelConstraints () {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func setDesign () {
        layer.cornerRadius = 30
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
    }
    
    func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: -20).isActive = true
        widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
