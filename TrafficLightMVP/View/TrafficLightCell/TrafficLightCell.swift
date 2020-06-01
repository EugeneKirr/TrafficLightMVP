//
//  TrafficLightCell.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

class TrafficLightCell: UICollectionViewCell {
    
    weak var delegate: InterfaceActionDelegate?
    
    @IBOutlet weak var greenLightButton: UIButton!
    @IBOutlet weak var yellowLightButton: UIButton!
    @IBOutlet weak var redLightButton: UIButton!
    @IBOutlet weak var trafficLightDescriptionLabel: UILabel!
    @IBOutlet weak var trafficLightSegmentedControl: UISegmentedControl!
    
    @IBAction func tapLightButton(_ sender: UIButton) {
        delegate?.tapActionForElement(with: sender.tag)
    }
    
    @IBAction func changeTrafficLightSegmentedControl(_ sender: UISegmentedControl) {
        delegate?.tapActionForElement(with: sender.selectedSegmentIndex)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        roundTheButtons()
    }
    
    func updateView(with trafficLight: TrafficLights) {
        [greenLightButton, yellowLightButton, redLightButton].forEach { button in
            button.backgroundColor = (button.tag == trafficLight.rawValue) ? trafficLight.color : .darkGray
        }
        trafficLightDescriptionLabel.text = trafficLight.description
        trafficLightSegmentedControl.selectedSegmentIndex = trafficLight.rawValue
    }
    
    func roundTheButtons() {
        [greenLightButton, yellowLightButton, redLightButton].forEach { button in
            button.layer.cornerRadius = button.bounds.width / 2
        }
    }
    
}
