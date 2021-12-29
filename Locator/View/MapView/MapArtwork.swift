//
//  MapArtwork.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import MapKit 

class MapArtwork: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: -5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = UIColor.orange
        }
    }
}
