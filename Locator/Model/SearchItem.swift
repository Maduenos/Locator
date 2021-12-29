//
//  SearchItem.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import Foundation

struct SearchItem: Decodable {
    
    var summary: Summary
    var results: [Result]
    
}

struct Summary: Decodable {
    
    var numResults: Int
    var offset: Int
    var query: String
    var queryTime: Int
    
}

struct Result: Decodable {
    
    var id: String
    var poi: ResultDetails
    var address: ResultAdress
    var position: ResultPosition?
    
}

struct ResultDetails: Decodable {
    
    var name: String
    var categories: [String]
    
}

struct ResultAdress: Decodable {
    
    var streetNumber: String?
    var streetName: String?
    var municipality: String?
    var postalCode: String?
    var countryCode: String?
    var country: String?
    var countryCodeISO3: String?
    var freeformAddress: String?
    var localName: String?
    
}

struct ResultPosition: Decodable {
    
    var lat: Double
    var lon: Double
    
}
