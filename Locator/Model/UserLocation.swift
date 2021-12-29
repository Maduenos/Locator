//
//  UserLocation.swift
//  Locator
//
//  Created by Mahammad on 29.12.2021.
//

import Foundation

struct UserLocation {
    
    var latitude: Double?
    var longtitude: Double?
    var isSet : Bool = false
    
    mutating func setCoordinates (_ latitude: Double?, _ longtitude: Double?) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
    
    mutating func isSetDefine () {
        isSet = true
    }
    
}
