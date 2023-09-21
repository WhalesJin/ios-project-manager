//
//  TaskCellView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 9/20/23.
//

import SwiftUI

struct TaskCellView: View {
    @EnvironmentObject var kanbanVM: KanbanViewModel
    let vm: TaskCellViewModel
    
    init(task: Task) {
        self.vm = TaskCellViewModel(task: task)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(vm.task.title)")
                .font(.title3)
                .lineLimit(1)
            Text("\(vm.task.content)")
                .foregroundColor(.secondary)
                .lineLimit(3)
            Text("\(vm.date)")
                .foregroundColor(vm.isOverdued ? .red : .primary)
                .font(.footnote)
        }
        .onTapGesture {
            kanbanVM.presentDetailFormView(task: vm.task)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button("Delete", role: .destructive) {
                kanbanVM.delete(vm.task)
            }
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(task: KanbanViewModel.mock.tasks[0])
    }
}
