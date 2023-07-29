//
//  TodoDetailViewModel.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation

protocol TodoDetailViewModelProtocol{
    func addTodo(title: String, desc: String, dueDate: Date)
}

class TodoDetailViewModel: ObservableObject{
    private let todoRepository: TodoRepositoryProtocol
    
    @Published var todos: [Todo] = []
    
    init(todoRepository: TodoRepositoryProtocol = TodoRepository()) {
        self.todoRepository = todoRepository
    }
}

extension TodoDetailViewModel: TodoDetailViewModelProtocol{
    func addTodo(title: String, desc: String, dueDate: Date) {
        self.todoRepository.addTodo(title: title, desc: desc, dueDate: dueDate)
    }
    
    
}
