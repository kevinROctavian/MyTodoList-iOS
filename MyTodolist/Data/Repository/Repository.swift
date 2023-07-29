//
//  Repository.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation


protocol TodoRepositoryProtocol{
    func addTodo(title: String, desc: String, dueDate: Date)
    func getTodo() -> [Todo]
}

final class TodoRepository {
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
}

extension TodoRepository: TodoRepositoryProtocol{
    func addTodo(title: String, desc: String, dueDate: Date) {
        dataManager.addTodo(title: title, desc: desc, dueDate: dueDate)
    }
    
    func getTodo() -> [Todo] {
        let todos = try? dataManager.getTodo()
        return todos ?? []
    }
}
