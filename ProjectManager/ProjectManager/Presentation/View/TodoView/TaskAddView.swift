//
//  TaskAddView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct TaskAddView: View {
    @State private var title = ""
    @State private var date = Date()
    @State private var content = ""
    
    var body: some View {
        VStack {
            TextField("", text: $title)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .shadow(color: .secondary, radius: 1, x: 5, y: 3)
            DatePicker("", selection: $date)
                .datePickerStyle(.wheel)
            TextEditor(text: $content)
                .font(.body)
                .shadow(color: .secondary, radius: 1, x: 5, y: 3)
        }
        .padding()
        
    }
}

struct TaskAddView_Previews: PreviewProvider {
    static var previews: some View {
        TaskAddView()
    }
}
