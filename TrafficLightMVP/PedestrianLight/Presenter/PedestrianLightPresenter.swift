//
//  PedestrianLightPresenter.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class PedestrianLightPresenter: ViewInteractable {
    
    private let service = TrafficLightService()
    
    weak var view: PresenterInteractable?
    
    required init(_ viewToInteract: PresenterInteractable?) {
        self.view = viewToInteract
    }

    func lightSectionChanged(_ index: Int) {
        service.setPedestrianLight(for: index)
        view?.updateLightView(with: service.getPedestrianLight())
    }
    
    func viewWillAppear() {
        view?.updateLightView(with: service.getPedestrianLight())
    }
    
}
