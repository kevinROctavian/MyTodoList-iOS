//
//  StorageService.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation

protocol StorageServiceProtocol {
    func upsertTodo(todo: Todo)
    func getTodo() -> [Todo]
}

final class StorageService {
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
}

extension StorageService: StorageServiceProtocol {
    
    
    func upsertTodo(todo: Todo) {
        dataManager.upsertTodo(todo: todo)
    }
    
    func getTodo() -> [Todo] {
        let todos = try? dataManager.getTodo()
        return todos ?? []
    }
}
