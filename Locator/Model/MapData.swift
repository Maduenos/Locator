//
//  MapData.swift
//  Locator
//
//  Created by Mahammad on 29.12.2021.
//

import Foundation
import CoreLocation

struct MapData {
    
    var dataContainer: [AnnotationView] = []
    var searchBarActive: Bool = true
    
    mutating func resetContainer () {
        dataContainer.removeAll()
    }
    
    mutating func addMapArtwork (_ data: SearchItem) -> [AnnotationView] {
        for singleLocation in data.results {
            guard let mapLatitude = singleLocation.position?.lat,
                  let mapLongtitude = singleLocation.position?.lon else { return [] }
            
            let annotationView = AnnotationView(title: singleLocation.poi.name,
                                                locationName: singleLocation.address.freeformAddress ?? "--",
                                                coordinate: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongtitude),
                                                locationData: singleLocation)
            
            dataContainer.append(annotationView)
        }
        
        return dataContainer
    }
    
}
