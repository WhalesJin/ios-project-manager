//
//  ListView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 9/20/23.
//

import SwiftUI

struct KanbanSectionView: View {
    var tasks: [Task]
    let title: String
    
    var body: some View {
        List {
            Section {
                ForEach(tasks) { task in
                    TaskCellView(task: task)
                }
            } header: {
                HStack {
                    Text("\(title)")
                        .font(.title)
                        .foregroundColor(.primary)
                    Text("\(tasks.count)")
                        .foregroundColor(.white)
                        .bold()
                        .padding(6)
                        .background {
                            Circle().fill(.black)
                        }
                }                
            }
        }
        .listStyle(.grouped)
    }
}

struct KanbanSectionView_Previews: PreviewProvider {
    static var previews: some View {
        KanbanSectionView(tasks: KanbanViewModel.mock.tasks, title: "TODO")
    }
}
