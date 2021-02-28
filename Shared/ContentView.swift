//
//  ContentView.swift
//  Shared
//
//  Created by yumemi narawa on 2021/01/27.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var todos: [String] = []
  
    var body: some View {
      
      HStack {
        Text("TODO")
          .font(.title)
          .fontWeight(.bold)
        Spacer()
      }
      .padding()
      
      HStack(alignment: .center, spacing: 8) {
        TextField("やること", text: $text)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button(action: {
          addTodo()
        }){
          Text("追加")
        }
        .buttonStyle(primaryButtonStyle())
      }
      .padding()
      
      List {
        ForEach(todos.indices, id: \.self) { index in
          HStack {
            Text(todos[index])
            
            Spacer()
            
            Button(action: {
              removeTodo(index: index)
            }){
              Text("完了")
            }
            .buttonStyle(primaryButtonStyle())
          }
        }
      }
    }
    
    // --- --- --- Functions --- --- --- //
    func addTodo() {
      todos.append(text)
      text = ""
    }
  
    func removeTodo(index: Int) {
      todos.remove(at: index)
    }
  
    struct primaryButtonStyle: ButtonStyle {
      func makeBody(configuration: Self.Configuration) -> some View {
        configuration
          .label
          .foregroundColor(configuration.isPressed ? .gray : Color.accentColor)
          .padding(2)
          .cornerRadius(8)
       }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
