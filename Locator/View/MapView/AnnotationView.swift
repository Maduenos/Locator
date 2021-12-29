//
//  AnnotationView.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import MapKit
import Contacts

class AnnotationView: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    var locationData : Result?
    
    init(title: String?, locationName: String?, coordinate: CLLocationCoordinate2D, locationData: Result) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.locationData = locationData
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        
        let adressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: adressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
