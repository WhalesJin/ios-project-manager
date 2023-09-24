//
//  TaskFormViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import Foundation

final class TaskFormViewModel: ObservableObject {
    @Published var title: String
    @Published var date: Date
    @Published var content: String
    
    @Published var isEditable: Bool
    
    init(
        title: String = "",
        date: Date = .now,
        content: String = "",
        isEditable: Bool
    ) {
        self.title = title
        self.date = date
        self.content = content
        self.isEditable = isEditable
    }
    
    var task: Task {
        Task(
            title: title,
            content: content,
            date: date,
            state: .todo
        )
    }
    
    func updateTask(original: Task) -> Task {
        var task = original
        task.title = title
        task.content = content
        task.date = date
        
        return task
    }
}
