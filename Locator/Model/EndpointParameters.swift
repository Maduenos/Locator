//
//  EndpointParameters.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import Foundation

struct EndpointParameters {
    
    var apiKey: String
    var query: String
    var radius: String
    var lat: String
    var lon: String
    
    private var latitude: Double?
    private var longtitude: Double?
    
    init(apiKey: String, query: String, radius: String, latitude: Double? = nil, longtitude: Double? = nil) {
        self.apiKey = apiKey
        self.query = query
        self.radius = radius
        self.lat = ""
        self.lon = ""
        self.latitude = latitude
        self.longtitude = longtitude
        
        setCoordinates()
    }
    
    mutating func setCoordinates () {
        if (latitude != nil) {
            lat = "&lat=\(latitude!)"
            lon = "&lon=\(longtitude!)"
        }
    }
    
}
