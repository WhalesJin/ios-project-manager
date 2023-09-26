//
//  EditTaskView.swift
//  ProjectManager
//
//  Created by Whales on 9/27/23.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject private var kanbanViewModel: KanbanViewModel
    @ObservedObject private var editTaskViewModel: EditTaskViewModel
    
    @FocusState private var textEditorIsFocused: Bool
    @Namespace var textEditor
    
    var task: Task
    
    init(task: Task, size: CGSize = CGSize(width: 1000, height: 800)) {
        self.task = task
        self.editTaskViewModel = EditTaskViewModel(task: task, formSize: size)
    }
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        TextField(task.title, text: $editTaskViewModel.task.title)
                            .shadowBackground()
                        DatePicker(
                            "날짜를 입력하세요",
                            selection: $editTaskViewModel.task.date,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                                                
                        TextEditor(text: $editTaskViewModel.task.content)
                            .focused($textEditorIsFocused)
                            .shadowBackground()
                            .frame(height: editTaskViewModel.formHeight * 0.5)
                            .id(textEditor)
                            .onChange(of: textEditorIsFocused) { isFocused in
                                if isFocused {
                                    withAnimation {
                                        proxy.scrollTo(textEditor, anchor: .center)
                                    }
                                } else {
                                    withAnimation {
                                        proxy.scrollTo(textEditor, anchor: .bottom)
                                    }
                                }
                            }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        kanbanViewModel.setEditFormVisible(false)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        let editedTask = editTaskViewModel.task
                        
                        kanbanViewModel.edit(task, newTask: editedTask)
                        kanbanViewModel.setEditFormVisible(false)
                    }
//                    .disabled(taskFormViewModel.title.isEmpty)
                }
            }
            .navigationTitle(editTaskViewModel.formTitle)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .cornerRadius(10)
        .frame(width: editTaskViewModel.formWidth, height: editTaskViewModel.formHeight)
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: Task(title: "탁구하기🏓", content: "삶이 있는 한 희망은 있다", date: .now, state: .todo))
    }
}
