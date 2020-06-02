//
//  TrafficLightPresenter.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    
    private let service = TrafficLightService()
    
    private weak var view: PresenterInteractable?
    
    func trafficLightSectionChanged(_ index: Int) {
        service.setTrafficLight(for: index)
        view?.updateLightView(with: service.getTrafficLight())
    }
    
    func viewDidLoad(_ viewToInteract: PresenterInteractable) {
        self.view = viewToInteract
        view?.initSetup()
    }
    
    func viewWillAppear() {
        view?.updateLightView(with: service.getTrafficLight())
    }
    
    func viewDidAppear() {
        view?.reloadView()
    }
    
}
