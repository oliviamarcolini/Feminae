//
//  ToDoList.swift
//  Feminae
//
//  Created by Dhiraj Tiwari on 7/15/25.
//

import SwiftUI

struct ToDoList: View {
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                     .font(.system(size: 40))
                     .fontWeight(.black)
                Spacer()
                
                Button {
                    
                } label: {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
            } //HStack
            .padding()
            Spacer()
        } //VStack
    } //body
} //struct

#Preview {
    ToDoList()
}
