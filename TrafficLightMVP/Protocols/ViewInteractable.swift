//
//  ViewInteractable.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 03/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

protocol ViewInteractable: AnyObject {
    
    var view: PresenterInteractable? { get set }
    
    init(_ viewToInteract: PresenterInteractable?)
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func lightSectionChanged(_ index: Int)
    
    func lightSectionDemanded(_ index: Int)
    
}

extension ViewInteractable {
    
    func viewDidLoad() {
        view?.initSetup()
    }
    
    func viewDidAppear() {
        view?.reloadView()
    }
    
    func lightSectionDemanded(_ index: Int) {
        lightSectionChanged(index)
    }
    
}
