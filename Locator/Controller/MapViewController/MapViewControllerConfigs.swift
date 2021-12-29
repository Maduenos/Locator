//
//  MapViewControllerConfigs.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//


import UIKit
import MapKit
import CoreLocation

extension MapViewController : CLLocationManagerDelegate, MKMapViewDelegate {
    
    func addMapConstraints () {
        map.translatesAutoresizingMaskIntoConstraints = false;
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        map.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
        map.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true;
        map.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
    }
    
    func registerNewMarker () {
        map.delegate = self
        map.register(MapArtwork.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                                            longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        if (!userLocationData.isSet) {
            map.setRegion(region, animated: true)

            userLocationData.isSetDefine()
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let artwork = view.annotation as? AnnotationView else { return }
        let detailsController = DetailsViewController()
        detailsController.selectedPlace = artwork.locationData
        let detailsActivityController = DetailsActivityViewController(controller: detailsController)
        
        present(detailsActivityController, animated: true, completion: nil)
    }
    
    func getUserCurrentLocation () {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        userLocationData.setCoordinates(locationManager.location?.coordinate.latitude,
                                        locationManager.location?.coordinate.longitude)
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.startUpdatingLocation()
        }
    }
    
}
