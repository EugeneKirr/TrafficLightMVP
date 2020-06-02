//
//  UITabBarControllerExtensions.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    func prepareViewController<T: UIViewController>(_ vcType: T.Type, title: String?, imageSystemName: String, tag: Int) -> UIViewController {
        let vcIdentifier = String(describing: vcType)
        let sbName = String(vcIdentifier.dropLast("ViewController".count))
        
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(identifier: vcIdentifier)
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageSystemName), tag: tag)
        return vc
    }
    
}
