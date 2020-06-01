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
        presenter.viewDidLoad(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

}

extension TrafficLightViewController: PresenterInteractable {
    
    func initSetup() {
        dataProvider.interfaceActionDelegate = self
        collectionView.delegate = dataProvider
        collectionView.dataSource = dataProvider
        collectionView.register(UINib(nibName: dataProvider.cellDescribingString, bundle: nil), forCellWithReuseIdentifier: dataProvider.cellDescribingString)
    }
    
    func reloadView() {
        collectionView.reloadData()
    }
    
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
