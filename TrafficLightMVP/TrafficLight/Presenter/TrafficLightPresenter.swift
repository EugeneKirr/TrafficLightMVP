//
//  TrafficLightPresenter.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class TrafficLightPresenter: ViewInteractable {

    private let service = TrafficLightService()
    
    weak var view: PresenterInteractable?
    
    required init(_ viewToInteract: PresenterInteractable?) {
        self.view = viewToInteract
    }

    func lightSectionChanged(_ index: Int) {
        service.setTrafficLight(for: index)
        view?.updateLightView(with: service.getTrafficLight())
    }
    
    func viewWillAppear() {
        view?.updateLightView(with: service.getTrafficLight())
    }
    
}
