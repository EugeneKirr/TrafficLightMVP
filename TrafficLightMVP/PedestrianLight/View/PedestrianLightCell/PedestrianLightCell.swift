//
//  PedestrianLightCell.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class PedestrianLightCell: UICollectionViewCell {
    
    weak var delegate: InterfaceActionDelegate?
    
    @IBOutlet weak var redLightButton: UIButton!
    @IBOutlet weak var greenLightButton: UIButton!
    @IBOutlet weak var pedestrianLightDescriptionLabel: UILabel!
    @IBOutlet weak var pedestrianLightDemandButton: UIButton!
    
    @IBAction func tapLightButton(_ sender: UIButton) {
        delegate?.tapActionForElement(with: sender.tag)
    }
    
    @IBAction func tapDemandButton(_ sender: UIButton) {
        delegate?.tapActionForElement(with: sender.tag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundTheButtons()
        borderDemandButton()
    }
    
    func updateView(with pedestrianLight: PedestrianLights) {
        [greenLightButton, redLightButton].forEach { button in
            button.tintColor = (button.tag == pedestrianLight.rawValue) ? pedestrianLight.color : .darkGray
        }
        pedestrianLightDescriptionLabel.text = pedestrianLight.description
    }
    
    func roundTheButtons() {
        [greenLightButton, redLightButton, pedestrianLightDemandButton].forEach { button in
            button.layer.cornerRadius = button.bounds.width / 2
        }
    }
    
    func borderDemandButton() {
        pedestrianLightDemandButton.layer.borderWidth = 12
        pedestrianLightDemandButton.layer.borderColor = UIColor.systemGray.cgColor
    }
}
