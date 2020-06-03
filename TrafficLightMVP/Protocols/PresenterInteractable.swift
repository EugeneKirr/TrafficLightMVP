//
//  PresenterInteractable.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

protocol PresenterInteractable: UIViewController {
    
    var presenter: ViewInteractable? { get set }
    
    func initSetup()
    
    func reloadView()
    
    func updateLightView(with light: LightViewUsable)
    
}
