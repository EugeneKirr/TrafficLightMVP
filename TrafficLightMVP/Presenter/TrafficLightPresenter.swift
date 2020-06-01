//
//  TrafficLightPresenter.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    
    private let manager = TrafficLightManager()
    
    weak var view: PresenterInteractable?
    
    func trafficLightSectionChanged(_ index: Int) {
        let newTrafficLight = manager.getTrafficLight(for: index)
        view?.updateTrafficLightView(with: newTrafficLight)
    }
    
}
