//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

class ToDoListViewModelImp: ToDoListViewModel {
    
    weak var view: ToDoListView?
    let toDoListRepository: ToDoListRepository
    private var items = [Item]()
    
    required init(view: ToDoListView?, toDoListRepository: ToDoListRepository) {
        self.view = view
        self.toDoListRepository = toDoListRepository
    }
    
    func getToDoList() {
        toDoListRepository.getToDoList {
            [weak self] response in
            self?.items = response
            self?.view?.setToDoList(items: self?.items ?? [Item]())
        }
    }
}
