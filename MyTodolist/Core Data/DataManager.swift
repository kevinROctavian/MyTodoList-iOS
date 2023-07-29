//
//  DataManager.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation
import CoreData

protocol DataManagerProtocol {
    func upsertTodo(todo: Todo)
    func getTodo() throws -> [Todo]
    func deleteTodo(todo: Todo)
}

final class DataManager {
    
    private var managedObjectContext: NSManagedObjectContext! = nil
    private var entity: NSEntityDescription! = nil
    
    required init() {
        debugPrint(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        managedObjectContext = CoreDataStack.shared.mainContext
        managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        if let entityDescription = NSEntityDescription.entity(
            forEntityName: "Todo",
            in: managedObjectContext) {
            entity = entityDescription
        }
    }
}

extension DataManager: DataManagerProtocol{
    func upsertTodo(todo: Todo) {
        if let object = isTodoExist(todo: todo){
            self.saveContext(completion: {})
            return
        }

        managedObjectContext.perform {
            let object = Todo(entity: self.entity, insertInto: self.managedObjectContext)
            object.desc = todo.desc
            object.dueDate = todo.dueDate
            object.title = todo.title
            object.id = String(1000 * Date().timeIntervalSince1970)
            self.saveContext(completion: {})
        }
    }
    
    func getTodo() throws -> [Todo] {
        let fetchRequest = NSFetchRequest<Todo>(entityName: Todo.entityName)
        let todos: [Todo]
        do {
            todos = try managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            throw ErrorModel(errorDescription: "Core Data Error. Could not fetch. \(error), \(error.userInfo)")
        }
        if todos.isEmpty {throw ErrorModel(errorDescription: "No Email Found")}
        return todos
    }
    
    func deleteTodo(todo: Todo) {
        
    }
    
    private func isTodoExist(todo: Todo) -> Todo? {
        let fetchRequest = NSFetchRequest<Todo>(entityName: Todo.entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", todo.id)
        do {
           let todos = try managedObjectContext.fetch(fetchRequest)
            if (!todos.isEmpty){
                return todos[0]
            }
        } catch _ as NSError {
            
        }
        return nil
    }
    
    // MARK: Database Operation
    
    private func saveContext(completion: @escaping () -> Void) {
        managedObjectContext.perform {
            do {
                try self.managedObjectContext.save()
                completion()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
}
