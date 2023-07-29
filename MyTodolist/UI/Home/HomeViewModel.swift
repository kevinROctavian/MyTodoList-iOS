//
//  HomeViewModel.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation


protocol HomeViewModelProtocol{
    func getTodoList()
}

class HomeViewModel: ObservableObject{
    private let todoRepository: TodoRepositoryProtocol
    
    @Published var todos: [Todo] = []
    
    init(todoRepository: TodoRepositoryProtocol = TodoRepository()) {
        self.todoRepository = todoRepository
    }
}

extension HomeViewModel: HomeViewModelProtocol{
    
    func getTodoList() {
        todos = self.todoRepository.getTodo()
    }
    
}
