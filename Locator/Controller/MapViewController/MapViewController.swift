//
//  ViewController.swift
//  Locator
//
//  Created by Mahammad on 27.12.2021.
//

import UIKit
import MapKit
import CoreLocation
import Combine

class MapViewController: UIViewController {

    var map : MKMapView = MKMapView()
    var locationManager : CLLocationManager!
    var searchBar: SearchBar = SearchBar()
    var radiusBar: RadiusBar = RadiusBar()
    var radiusButton: RadiusButton = RadiusButton()
    var searchTriggerer: SearchTriggerer?
    var dataRequester: DataRequester = DataRequester()
    var mapData: MapData = MapData()
    var userLocationData : UserLocation = UserLocation()
    var radiusBarModel : RadiusBarModel = RadiusBarModel()
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addMapConstraints()
        
        registerNewMarker()
        getUserCurrentLocation()
        
        callEventListeners()
        hideKeyboardWhenTappedAround()
    }

    func addSubviews () {
        view.addSubview(map)
        view.addSubview(searchBar)
        view.addSubview(radiusBar)
        view.addSubview(radiusButton)
    }
    
}

