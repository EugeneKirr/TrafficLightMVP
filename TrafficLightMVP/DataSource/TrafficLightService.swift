//
//  TrafficLightService.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    private let nc = NotificationCenter.default
    
    private var currentTrafficLight = TrafficLights.green
    
    private var currentPedestrianLight = PedestrianLights.red
    
    init() {
        nc.addObserver(self, selector: #selector(updateTrafficLight(withNotification:)),
                       name: NSNotification.Name("NewTrafficLight"), object: nil)
        nc.addObserver(self, selector: #selector(updatePedestrianLight(withNotification:)),
                       name: NSNotification.Name("NewPedestrianLight"), object: nil)
    }
    
    @objc private func updateTrafficLight(withNotification notification: Notification) {
        guard let userInfo = notification.userInfo,
              let newTrafficLight = userInfo["trafficLight"] as? TrafficLights else { fatalError() }
        currentTrafficLight = newTrafficLight
        checkPedestrianLight()
    }
    
    @objc private func updatePedestrianLight(withNotification notification: Notification) {
        guard let userInfo = notification.userInfo,
              let newPedestrianLight = userInfo["pedestrianLight"] as? PedestrianLights else { fatalError() }
        currentPedestrianLight = newPedestrianLight
        checkTrafficLight()
    }
    
    private func checkTrafficLight() {
        switch currentPedestrianLight {
        case .green: currentTrafficLight = .red
        case .red: currentTrafficLight = .green
        }
    }
    
    private func checkPedestrianLight() {
        switch currentTrafficLight {
        case .green: currentPedestrianLight = .red
        case .red: currentPedestrianLight = .green
        case .yellow: currentPedestrianLight = .red
        }
    }
    
    func setTrafficLight(for index: Int) {
        nc.post(name: NSNotification.Name("NewTrafficLight"), object: nil, userInfo: ["trafficLight": TrafficLights(index)])
    }
    
    func setPedestrianLight(for index: Int) {
        nc.post(name: NSNotification.Name("NewPedestrianLight"), object: nil, userInfo: ["pedestrianLight": PedestrianLights(index)])
    }
    
    func setPedestrianLightWithDelay(for index: Int, delay: TimeInterval, completion: @escaping (PedestrianLights) -> Void) {
        setTrafficLight(for: 1)
        Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            self.setPedestrianLight(for: index)
            completion(self.currentPedestrianLight)
        }
    }
    
    func getTrafficLight() -> TrafficLights {
        return currentTrafficLight
    }
    
    func getPedestrianLight() -> PedestrianLights {
        return currentPedestrianLight
    }
    
}
