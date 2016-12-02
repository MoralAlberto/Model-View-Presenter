//
//  AppDelegate.swift
//  Presenter
//
//  Created by Alberto Moral on 01/12/2016.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = createRootViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    private func createRootViewController() -> UIViewController {
        let view = ViewController()
        let useCase = ShowUsersInteractor()
        
        let presenter = ShowUserPresenter(view: view, interactor: useCase)
        view.presenter = presenter
        useCase.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}

