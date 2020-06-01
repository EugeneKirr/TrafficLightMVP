//
//  TrafficLightViewController.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private let dataProvider = TrafficLightDataProvider()
    
    private let presenter = TrafficLightPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        dataProvider.interfaceActionDelegate = self
        collectionView.delegate = dataProvider
        collectionView.dataSource = dataProvider
        collectionView.register(UINib(nibName: dataProvider.cellDescribingString, bundle: nil), forCellWithReuseIdentifier: dataProvider.cellDescribingString)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

}

extension TrafficLightViewController: PresenterInteractable {
    
    func updateTrafficLightView(with trafficLight: TrafficLights) {
        dataProvider.chosenTrafficLight = trafficLight
        collectionView.reloadData()
    }
    
}

extension TrafficLightViewController: InterfaceActionDelegate {
    
    func tapActionForElement(with index: Int) {
        presenter.trafficLightSectionChanged(index)
    }

}
