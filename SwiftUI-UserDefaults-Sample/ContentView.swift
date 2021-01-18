//
//  ContentView.swift
//  SwiftUI-UserDefaults-Sample
//
//  Created by 41nya on 2021/01/18.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    @State var invalidInput: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var data : ListData

    var body: some View {
        VStack {
            TextField(
                "Please type input down...",
                text: $input,
                onCommit: {add(input:input)})
                .autocapitalization(.none)
                .keyboardType(.URL)
                .alert(isPresented: $invalidInput) {
                    Alert(title: Text("Invalid input"), dismissButton: .default(Text("OK")))
                }
            List {
                ForEach (data.lists, id:\.self) { list in
                    Text(list.value)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                .onDelete(perform:delete)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    func add(input: String) {
        self.invalidInput = !data.add(input: input)
        if false == self.invalidInput {
            self.input=""
        }
    }
    
    func delete(at offsets: IndexSet) {
        self.data.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
