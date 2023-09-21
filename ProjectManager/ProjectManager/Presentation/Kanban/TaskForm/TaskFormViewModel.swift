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
    
    init(title: String = "", date: Date = .now, content: String = "", isEditable: Bool) {
        self.title = title
        self.date = date
        self.content = content
        self.isEditable = isEditable
    }
    
    func makeTask() -> Task {
        return Task(title: title, content: content, date: date)
    }
}
