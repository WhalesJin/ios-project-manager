//
//  TaskCellView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 9/20/23.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject private var kanbanVM: KanbanViewModel
    private let vm: CardViewModel
    
    init(task: Task) {
        self.vm = CardViewModel(task: task)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(vm.task.title)
                .font(.title3)
                .lineLimit(1)
            Text(vm.task.content)
                .foregroundColor(.secondary)
                .lineLimit(3)
            Text("\(vm.date)")
                .foregroundColor(vm.isOverdued ? .red : .primary)
                .font(.footnote)
        }
        .onTapGesture {
            kanbanVM.presentDetailFormView(task: vm.task)
        }
        .contextMenu(menuItems: {
            switch vm.task.state {
            case .todo:
                Button("Move to DOING"){ kanbanVM.move(vm.task, to: .doing) }
                Button("Move to DONE"){ kanbanVM.move(vm.task, to: .done) }
            case .doing:
                Button("Move to TODO"){ kanbanVM.move(vm.task, to: .todo) }
                Button("Move to DONE"){ kanbanVM.move(vm.task, to: .done) }
            case .done:
                Button("Move to TODO"){ kanbanVM.move(vm.task, to: .todo) }
                Button("Move to DOING"){ kanbanVM.move(vm.task, to: .doing) }
            }
        })
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button("Delete", role: .destructive) {
                kanbanVM.delete(vm.task)
            }
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(task: KanbanViewModel.mock.tasks[0])
    }
}
