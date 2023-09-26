//
//  TaskFormView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct TaskFormView: View {
    @EnvironmentObject private var kanbanVM: KanbanViewModel
    @ObservedObject private var vm: TaskFormViewModel
    let task: Task?
    let formSize: CGSize
    
    init(task: Task? = nil, formSize: CGSize) {
        self.task = task
        self.formSize = formSize
        
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
        ScrollView {
            VStack {
                TextField("할 일 제목을 입력하세요", text: $vm.title)
                    .shadowBackground()
                
                DatePicker("날짜를 입력하세요", selection: $vm.date, displayedComponents: [.date])
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                
                TextEditor(text: $vm.content)
                    .shadowBackground()
//                    .frame(minHeight: formSize.height * 0.5)
//                Spacer()
            }
            //                .disabled(!vm.isEditable)
            .padding()
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                if task == nil {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            kanbanVM.setFormViewVisible(false)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            kanbanVM.create(new: vm.task)
                            kanbanVM.setFormViewVisible(false)
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
            //            }
        }
        .frame(width: formSize.width, height: formSize.height)
    }
}

//struct TaskFormView_Previews: PreviewProvider {
//    @ObservedObject static var kanbanVM = KanbanViewModel.mock
//    static var previews: some View {
//        TaskFormView(task: kanbanVM.tasks[0])
//            .environmentObject(kanbanVM)
//    }
//}
