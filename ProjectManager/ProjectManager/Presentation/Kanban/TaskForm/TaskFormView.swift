//
//  TaskFormView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct TaskFormView: View {
    @EnvironmentObject var kanbanVM: KanbanViewModel
    @ObservedObject var vm: TaskFormViewModel
    let task: Task?
    
    init(task: Task? = nil) {
        self.task = task
        if let task = task {
            self.vm = TaskFormViewModel(
                title: task.title,
                date: task.date,
                content: task.content,
                isEditable: false
            )
        } else {
            self.vm = TaskFormViewModel(
                isEditable: true
            )
        }
    }
    
    var body: some View {
        VStack {
            TextField("할 일 제목을 입력하세요", text: $vm.title)
                .padding(8)
                .disabled(!vm.isEditable)
                .background {
                    Rectangle()
                        .fill(.background)
                        .shadow(color: .secondary, radius: 3, x: 2, y: 2)
                }
            
                
            DatePicker("날짜를 입력하세요", selection: $vm.date, displayedComponents: [.date])
                .labelsHidden()
                .disabled(!vm.isEditable)
                .datePickerStyle(.wheel)
            
            TextEditor(text: $vm.content)
                .padding(8)
                .disabled(!vm.isEditable)
                .background {
                    Rectangle()
                        .fill(.background)
                        .shadow(color: .secondary, radius: 3, x: 2, y: 2)
                }
        }
        .padding()
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            if task == nil {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        kanbanVM.dismissCreateFormView()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        let task = vm.makeTask()
                        kanbanVM.create(new: task)
                        kanbanVM.dismissCreateFormView()
                    }
                }
            } else {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Edit") {
                        vm.isEditable = true
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if let task = self.task, vm.isEditable {
                            let updated = vm.updateTask(original: task)
                            kanbanVM.update(updatedTask: updated)
                        }
                        
                        kanbanVM.dismissDetailFormView()
                    }
                }
            }
        }
    }
}

struct TaskFormView_Previews: PreviewProvider {
    @ObservedObject static var kanbanVM = KanbanViewModel.mock    
    static var previews: some View {
        TaskFormView(task: kanbanVM.tasks[0])
            .environmentObject(kanbanVM)
    }
}
