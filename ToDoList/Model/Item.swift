//
//  Item.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

struct Item: Codable {
    let title: String
    let details: Details
    
    init() {
        self.title = ""
        self.details = Details()
    }
}

struct Details: Codable {
    let description: String
    let day: Int
    
    var dayName: String {
        switch day {
        case 1:
            return "Monday"
        case 2:
            return "Thuesday"
        case 3:
            return "Wenesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            break
        }
        return ""
    }
    
    init() {
        self.description = ""
        self.day = 0
    }
}
