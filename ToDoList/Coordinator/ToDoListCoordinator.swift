//
//  ToDoListCoordinator.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation
import UIKit

class ToDoListCoordinator {
    var navigationController: UINavigationController
    private let toDoListFactory =  ToDoListFactoryImp()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let toDoListViewController = toDoListFactory.makeToDoListViewController(toDoListCoordinator: self)
        navigationController.setViewControllers([toDoListViewController], animated: false)
    }
}
