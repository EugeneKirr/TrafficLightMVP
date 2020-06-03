//
//  PedestrianLightViewController.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class PedestrianLightViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let dataProvider = PedestrianLightDataProvider()
    
    var presenter: ViewInteractable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
}

extension PedestrianLightViewController: PresenterInteractable {
    
    func initSetup() {
        dataProvider.interfaceActionDelegate = self
        collectionView.delegate = dataProvider
        collectionView.dataSource = dataProvider
        collectionView.register(UINib(nibName: dataProvider.cellDescribingString, bundle: nil), forCellWithReuseIdentifier: dataProvider.cellDescribingString)
    }
    
    func reloadView() {
        collectionView.reloadData()
    }
    
    func updateLightView(with light: LightViewUsable) {
        guard let pedestrianLight = light as? PedestrianLights else { return }
        dataProvider.chosenPedestrianLight = pedestrianLight
        collectionView.reloadData()
    }
 
}

extension PedestrianLightViewController: InterfaceActionDelegate {
    
    func tapActionForElement(with index: Int) {
        guard index == 2 else { presenter?.lightSectionChanged(index); return }
        presenter?.lightSectionDemanded(0)
    }
    
}
