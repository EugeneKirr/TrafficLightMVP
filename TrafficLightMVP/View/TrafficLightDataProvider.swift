//
//  TrafficLightDataProvider.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class TrafficLightDataProvider: NSObject {
    
    let cellDescribingString = String(describing: TrafficLightCell.self)
    
    weak var interfaceActionDelegate: InterfaceActionDelegate?
    
    var chosenTrafficLight = TrafficLights.green
    
}

extension TrafficLightDataProvider: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellDescribingString, for: indexPath) as? TrafficLightCell else { fatalError() }
        cell.delegate = interfaceActionDelegate
        cell.updateView(with: chosenTrafficLight)
        return cell
    }

}

extension TrafficLightDataProvider: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 0.90 * collectionView.bounds.height)
    }
    
}
