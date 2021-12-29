//
//  DetailsCell.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import Foundation

struct DetailsCell {
    
    var cellRow: Int
    var currentPlace: Result
    var header: String!
    var value: String!
    
    init (cellRow: Int, currentPlace: Result) {
        self.cellRow = cellRow
        self.currentPlace = currentPlace
        
        setHeader()
        setValue()
    }
    
    mutating func setValue () {
        if (cellRow == 0) {
            value = currentPlace.poi.name
            
            return
        }
        
        value = currentPlace.address.freeformAddress
    }
    
    mutating func setHeader () {
        if (cellRow == 0) {
            header = "Name"
            
            return
        }
        
        header = "Address"
    }
    
}
