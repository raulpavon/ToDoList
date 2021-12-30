//
//  ToDoListRepository.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

class ToDoListRepository {
    
    func getToDoList(_ completionHandler: @escaping ([Item]) -> Void) {
        
        guard let data = loadJSONData(filename: "items") else { return }
        
        do {
            let response = try JSONDecoder().decode([Item].self, from: data)
            completionHandler(response)
        } catch {
            print("Error decoding items: \(error)")
            return
        }
    }
    
    func loadJSONData(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
