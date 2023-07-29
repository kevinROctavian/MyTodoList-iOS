//
//  HomeView.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(vm.todos){ todo in
                    TodoItemView(todo: todo).padding(.bottom, 20)
                }.padding(20.0)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: TodoDetailView()) {
                        Text("Add Todo")
                    }
                }
            }
        }
        .onAppear {
            vm.getTodoList()
        }
    }
}

struct TodoItemView: View{
    var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Text(todo.title).font(.title3)
                Spacer()
            }
            Text(todo.desc).font(.body)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeView()
    }
}
