//
//  NavigationManager.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation
import UIKit

class NavigationManager {
    
    static var shared = NavigationManager()
    
    func setRootVC(withController:UIViewController,window:UIWindow) -> UIWindow {
        let navigationController = UINavigationController(rootViewController: withController)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
    
    func updateRootVC(withController:UIViewController) {
        let navigationController = UINavigationController(rootViewController: withController)
        navigationController.isNavigationBarHidden = true
        guard let window = self.getRootWindow() else {return}
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func getRootWindow() -> UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
          return nil
        }
        return sceneDelegate.window
    }
}

extension UINavigationController {

   func backToViewController(vc: Any) {
      for element in viewControllers as Array {
        if "\(type(of: element)).Type" == "\(type(of: vc))" {
            self.popToViewController(element, animated: true)
            break
         }
      }
   }
}
