//
//  RadiusBar.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class RadiusBar: UIView {
    
    var inputField: UITextField = UITextField()
    var doneButton: UIBarButtonItem!
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setDesign()
        setInputDesign()
        setCustomToolBar()
        animate(type: .disappear)
    }
    
    override func didMoveToSuperview() {
        setConstraints()
        setInputConstraints()
    }
    
    func addSubviews () {
        addSubview(inputField)
    }
    
    func setDesign () {
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        layer.cornerRadius = 7
    }
    
    func setInputDesign () {
        inputField.textAlignment = .center
        inputField.keyboardType = .numberPad
        inputField.textColor = .black
        inputField.attributedPlaceholder = NSAttributedString(
            string: "How close (Meters)?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)]
        )
    }
    
    func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setInputConstraints () {
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        inputField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        inputField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        inputField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    func animate (type: AnimationType) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1, y: type == .appear ? 1 : 0.001)
        }, completion: nil)
    }
    
    func setCustomToolBar () {
        let toolBar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: nil, action: nil)
        doneButton.tintColor = .white
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.init(red: 23/255, green: 23/255, blue: 20/255, alpha: 0.6)
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        inputField.inputAccessoryView = toolBar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
