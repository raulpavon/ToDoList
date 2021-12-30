//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var toDoListCoordinator: ToDoListCoordinator?
    let navController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        return true
    }
    
    func initializeWindow() {
        toDoListCoordinator = ToDoListCoordinator(navigationController: navController)
        toDoListCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
