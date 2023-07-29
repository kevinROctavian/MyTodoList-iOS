//
//  Repository.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation


protocol TodoRepositoryProtocol{
    func upsertTodo(todo: Todo)
    func getTodo() -> [Todo]
}

final class TodoRepository {
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
}

extension TodoRepository: TodoRepositoryProtocol{
    func upsertTodo(todo: Todo) {
        dataManager.upsertTodo(todo: todo)
    }
    
    func getTodo() -> [Todo] {
        let todos = try? dataManager.getTodo()
        return todos ?? []
    }
}
