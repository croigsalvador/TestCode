//
//  SceneDelegate.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: ApplicationCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let applicationCoordintor = ApplicationCoordinator(window: window)
        applicationCoordintor.start()
        
        self.coordinator = applicationCoordintor
        window.makeKeyAndVisible()
    }

}

