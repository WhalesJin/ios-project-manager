//
//  KanbanView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct KanbanView: View {
    @EnvironmentObject private var kanbanVM: KanbanViewModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                HStack(spacing: 10) {
                    ColumnView(tasks: kanbanVM.todoTasks, title: "TODO")
                    ColumnView(tasks: kanbanVM.doingTasks, title: "DOING")
                    ColumnView(tasks: kanbanVM.doneTasks, title: "DONE")
                }
                .background(.quaternary)
                .navigationTitle("Project Manager")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            kanbanVM.setFormViewVisible(true)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .customAlert(
                isOn: $kanbanVM.isFormViewOn,
                title: "Todo"
            ) {
                TaskFormView(formSize: geo.size)
            }
        }
//        .customAlert(selected: $kanbanVM.selectedTask, title: "Todo") {
////            TaskFormView(task: kanbanVM.selectedTask, formSize: <#CGSize#>)
//        }        
    }
}

struct KanbanView_Previews: PreviewProvider {
    @ObservedObject static var vm = KanbanViewModel.mock
    static var previews: some View {
        KanbanView()
            .environmentObject(vm)
    }
}
