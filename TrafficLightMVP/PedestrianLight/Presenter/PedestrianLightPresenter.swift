//
//  PedestrianLightPresenter.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class PedestrianLightPresenter {
    
    private let service = TrafficLightService()
    
    private weak var view: PresenterInteractable?
    
    func pedestrianLightSectionChanged(_ index: Int) {
        service.setPedestrianLight(for: index)
        view?.updateLightView(with: service.getPedestrianLight())
    }
    
    func pedestrianLightSectionDemanded(_ index: Int) {
        service.setPedestrianLight(for: index)
        view?.updateLightView(with: service.getPedestrianLight())
    }
    
    func viewDidLoad(_ viewToInteract: PresenterInteractable) {
        self.view = viewToInteract
        view?.initSetup()
    }
    
    func viewWillAppear() {
        view?.updateLightView(with: service.getPedestrianLight())
    }
    
    func viewDidAppear() {
        view?.reloadView()
    }
    
}
