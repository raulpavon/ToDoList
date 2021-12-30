//
//  ToDoListProtocols.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

protocol ToDoListView: AnyObject {
    func setToDoList(items: [Item])
}

protocol ToDoListViewModel {
    func getToDoList()
}
