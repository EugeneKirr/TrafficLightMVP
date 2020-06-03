//
//  UITabBarControllerExtensions.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    static func withDefaultSettings() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.barTintColor = UIColor.systemYellow
        tabBarController.tabBar.tintColor = UIColor.darkText
        return tabBarController
    }
    
}

extension UITabBarController {
        
    func setViewControllers(vcTypes: [PresenterInteractable.Type], presenterTypes: [ViewInteractable.Type], imageSystemNames: [String]) {
        guard vcTypes.count == presenterTypes.count, vcTypes.count == imageSystemNames.count else { fatalError() }
        var viewControllers = [PresenterInteractable]()
        for index in 0..<vcTypes.count {
            let vc = prepareViewController(vcTypes[index], with: presenterTypes[index], title: nil, imageSystemName: imageSystemNames[index], tag: index)
            viewControllers.append(vc)
        }
        setViewControllers(viewControllers, animated: true)
    }
    
    private func prepareViewController(_ vcType: PresenterInteractable.Type, with presenterType: ViewInteractable.Type, title: String?, imageSystemName: String, tag: Int) -> PresenterInteractable {
        let vcIdentifier = String(describing: vcType)
        let sbName = String(vcIdentifier.dropLast("ViewController".count))
        
        let sb = UIStoryboard(name: sbName, bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: vcIdentifier) as? PresenterInteractable else { fatalError() }
        vc.presenter = presenterType.init(vc)
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageSystemName), tag: tag)
        return vc
    }
    
}
