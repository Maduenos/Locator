//
//  ResultCollectionViewCell.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    var cellHeaderLabel: UILabel = UILabel()
    var cellValueLabel: UILabel = UILabel()
    var currentPlace: Result!
    var cellData: DetailsCell!
    
    var cellRow: Int! {
        didSet {
            cellData = DetailsCell(cellRow: cellRow, currentPlace: currentPlace)
            
            cellHeaderDesign()
            setValueDesign()
        }
    }
    
    func addSubviews () {
        addSubview(cellHeaderLabel)
        addSubview(cellValueLabel)
    }
    
    func cellHeaderDesign () {
        cellHeaderLabel.textColor = .systemGray
        cellHeaderLabel.font = UIFont(name: "Helvetica", size: 17)
        cellHeaderLabel.text = cellData.header
    }
    
    func cellHeaderConstraints () {
        cellHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        cellHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellHeaderLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        cellHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        cellHeaderLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setValueDesign () {
        cellValueLabel.textColor = .white
        cellValueLabel.font = UIFont(name: "Helvetica", size: 16)
        cellValueLabel.text = cellData.value
        cellValueLabel.numberOfLines = 0
    }
    
    func cellValueConstraints () {
        cellValueLabel.translatesAutoresizingMaskIntoConstraints = false
        cellValueLabel.topAnchor.constraint(equalTo: cellHeaderLabel.bottomAnchor).isActive = true
        cellValueLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        cellValueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        cellValueLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setDesign () {
        backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setDesign()
        
        cellHeaderConstraints()
        cellValueConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
