//
//  TodoDetailView.swift
//  MyTodolist
//
//  Created by Kevin on 29/07/23.
//

import Foundation
import SwiftUI

struct TodoDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    @State private var email = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Title:")
            TextField("Type your title here", text: $email)
            HStack{
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }.padding(.top, 10)
            Spacer()
        }.padding()
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView()
    }
}
