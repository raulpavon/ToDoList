//
//  ToDoListFactory.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

protocol ToDoListFactory {
    func makeToDoListViewController(toDoListCoordinator: ToDoListCoordinator) -> ToDoListViewController
    func makeToDoListViewModel(view: ToDoListView, toDoListRepository: ToDoListRepository) -> ToDoListViewModel
    func makeToDoListRepository() -> ToDoListRepository
}

class ToDoListFactoryImp: ToDoListFactory {
    func makeToDoListViewController(toDoListCoordinator: ToDoListCoordinator) -> ToDoListViewController {
        let movieListViewController = ToDoListViewController(factory: self, toDoListCoordinator: toDoListCoordinator)
        return movieListViewController
    }
    
    func makeToDoListViewModel(view: ToDoListView, toDoListRepository: ToDoListRepository) -> ToDoListViewModel {
        let viewModel = ToDoListViewModelImp(view: view, toDoListRepository: toDoListRepository)
        return viewModel
    }
    
    func makeToDoListRepository() -> ToDoListRepository {
        let repository = ToDoListRepository()
        return repository
    }
}
