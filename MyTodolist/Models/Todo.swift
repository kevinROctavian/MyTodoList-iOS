//
//  Todo.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation
import CoreData

@objcMembers
final class Todo: NSManagedObject {
    static var entityName: String {
        return "Todo"
    }
    @NSManaged var id: String
    @NSManaged var title: String
    @NSManaged var desc: String
    @NSManaged var dueDate: Date
}

extension Todo: Identifiable{}
