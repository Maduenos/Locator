//
//  EventListeners.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import Foundation
import UIKit
import Combine
import CoreLocation

extension MapViewController {
    
    func callEventListeners () {
        radiusButtonClick()
        addEvenDoneButton()
        initTriggerer()
    }
    
    func resetMapArtwork () {
        map.removeAnnotations(mapData.dataContainer)
        mapData.resetContainer()
    }
    
    func addMapArtwork (_ data: SearchItem) {
        map.addAnnotations(mapData.addMapArtwork(data))
    }
    
    func radiusButtonClick () {
        radiusBarModel.setTapOnRadiusButton(button: radiusButton)
        
        radiusBarModel.radiusTapped.sink { [weak self] _ in
            self?.triggerRadiusBar()
        }.store(in: &cancellables)
    }
    
    func addEvenDoneButton () {
        radiusBarModel.setTapOnBarDone(button: radiusBar.doneButton)
        
        radiusBarModel.barTapped.sink { [weak self] _ in
            self?.triggerRadiusBar()
            self?.dismissKeyboard()
        }.store(in: &cancellables)
    }
    
    @objc func triggerRadiusBar () {
        if (mapData.searchBarActive) {
            mapData.searchBarActive = !mapData.searchBarActive
            
            radiusBar.animate(type: .appear)
            searchBar.animate(type: .disappear)
            radiusButton.renameLabel(buttonText: "Done")
            
            return
        }
        
        mapData.searchBarActive = !mapData.searchBarActive
        radiusBar.animate(type: .disappear)
        searchBar.animate(type: .appear)
        radiusButton.renameLabel(buttonText: "Radius")
        initSearch()
    }
    
    func initTriggerer () {
        searchTriggerer = SearchTriggerer(textField: searchBar.inputField,
                                          searchIcon: searchBar.searchIcon)
        
        searchTriggerer?.isClicked.sink(receiveValue: { [weak self] _ in
            self?.initSearch()
            self?.dismissKeyboard()
        }).store(in: &cancellables)
    }
    
    @objc func initSearch () {
        let parameters = EndpointParameters(apiKey: Constants.apiKey,
                                            query: searchBar.inputField.text ?? "",
                                            radius: radiusBar.inputField.text ?? "0",
                                            latitude: userLocationData.latitude,
                                            longtitude: userLocationData.longtitude)
        
        dataRequester.initSearch(endpointParameters: parameters)
        dataRequester.dataReceived.sink(receiveValue: { [weak self] data in
            self?.resetMapArtwork()
            self?.addMapArtwork(data)
        }).store(in: &cancellables)
    }
    
}
