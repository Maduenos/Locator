//
//  SearchBar.swift
//  Locator
//
//  Created by Mahammad on 27.12.2021.
//

import UIKit

class SearchBar: UIView {
    
    var searchIcon: UIImageView = UIImageView()
    var inputField: UITextField = UITextField()
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setDesign()
        searchIconDesign()
        setInputDesign()
    }
    
    override func didMoveToSuperview() {
        setConstraints()
        setIconConstraints()
        setInputConstraints()
    }
    
    func addSubviews () {
        addSubview(searchIcon)
        addSubview(inputField)
    }
    
    func setDesign () {
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        layer.cornerRadius = 7
    }
    
    func searchIconDesign () {
        searchIcon.image = UIImage(named: "search")
        searchIcon.isUserInteractionEnabled = true
    }
    
    func setInputDesign () {
        inputField.textColor = .black
        inputField.attributedPlaceholder = NSAttributedString(
            string: "What are you searching?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)]
        )
    }
    
    func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    func setIconConstraints () {
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor).isActive = true
        searchIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    func setInputConstraints () {
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        inputField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        inputField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        inputField.rightAnchor.constraint(equalTo: searchIcon.leftAnchor, constant: -10).isActive = true
    }
    
    func animate (type: AnimationType) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1, y: type == .appear ? 1 : 0.001)
        }, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
