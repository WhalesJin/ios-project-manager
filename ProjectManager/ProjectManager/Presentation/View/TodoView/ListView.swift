//
//  ListView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 9/20/23.
//

import SwiftUI

struct ListView: View {
    var tasks: [Task]
    let title: String
    
    var body: some View {
        List {
            Section {
                ForEach(tasks) { task in
                    CellView(task: task)
                }
            } header: {
                Text("\(title)")
                    .font(.title)
                    .foregroundColor(.primary)
            }
        }
        .listStyle(.grouped)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(tasks: TodoView.ViewModel.mock.todos, title: "TODO")
    }
}
