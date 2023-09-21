//
//  KanbanView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct KanbanView: View {
    @EnvironmentObject var kanbanVM: KanbanViewModel
    
    var body: some View {        
        NavigationStack {
            HStack(spacing: 10) {
                KanbanSectionView(tasks: kanbanVM.todos, title: "TODO")
                KanbanSectionView(tasks: kanbanVM.doings, title: "DOING")
                KanbanSectionView(tasks: kanbanVM.dones, title: "DONE")
            }
            .background(.quaternary)
            .navigationTitle("Project Manager")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        kanbanVM.presentCreateFormView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .customAlert(isOn: $kanbanVM.isFormViewOn, title: "Todo") {
            TaskFormView()
        }
        .customAlert(selected: $kanbanVM.selectedTask, title: "Todo") {
            TaskFormView(task: kanbanVM.selectedTask)
        }
    }
}

struct KanbanView_Previews: PreviewProvider {
    @ObservedObject static var vm = KanbanViewModel.mock
    static var previews: some View {
        KanbanView()
            .environmentObject(vm)
    }
}
