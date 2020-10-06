//
//  PedestrianLightDataProvider.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class PedestrianLightDataProvider: NSObject {
    
    let cellDescribingString = String(describing: PedestrianLightCell.self)
    
    weak var interfaceActionDelegate: InterfaceActionDelegate?
    
    var chosenPedestrianLight = PedestrianLights.green
    
}

extension PedestrianLightDataProvider: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellDescribingString, for: indexPath) as? PedestrianLightCell else { fatalError() }
        cell.delegate = interfaceActionDelegate
        cell.updateView(with: chosenPedestrianLight)
        return cell
    }
    
}

extension PedestrianLightDataProvider: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.safeAreaLayoutGuide.layoutFrame.size
    }
    
}
