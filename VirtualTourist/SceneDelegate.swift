//
//  SceneDelegate.swift
//  VirtualTourist
//
//  Created by Desha Washington on 6/20/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let dataController = DataController(modelName: "VirtualTourist")

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        dataController.load {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rootVC = storyboard.instantiateViewController(identifier: "TravelLocationsMapView") as! TravelLocationsMapViewController
            rootVC.dataController = self.dataController
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = UINavigationController(rootViewController: rootVC)
            
            guard let windowScene = (scene as? UIWindowScene)else { return }
            self.window?.windowScene = windowScene
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        dataController.saveContext()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        dataController.saveContext()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        dataController.saveContext()
    }


}

