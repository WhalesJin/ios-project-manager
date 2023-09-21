//
//  TaskCellView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 9/20/23.
//

import SwiftUI

struct TaskCellView: View {
    @EnvironmentObject var kanbanVM: KanbanViewModel
    @ObservedObject var vm = TaskCellViewModel()
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(task.title)")
                .font(.title3)
                .lineLimit(1)
            Text("\(task.content)")
                .foregroundColor(.secondary)
                .lineLimit(3)
            Text("\(task.date)")
                .foregroundColor(vm.isOverdued(date: task.date) ? .red : .primary)
                .font(.footnote)
        }
        .onTapGesture {
            kanbanVM.presentDetailFormView(task: task)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button("Delete", role: .destructive) {
                kanbanVM.delete(task)
            }
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(task: KanbanViewModel.mock.tasks[0])
    }
}
