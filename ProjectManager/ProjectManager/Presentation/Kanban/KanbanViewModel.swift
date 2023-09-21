//
//  KanbanViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//
import SwiftUI


final class KanbanViewModel: ObservableObject {
    @Published var todos: [Task]
    @Published var doings: [Task]
    @Published var dones: [Task]
    
    @Published var isFormViewOn: Bool
    @Published var selectedTask: Task?
    
    init(
        todos: [Task] = [],
        doings: [Task] = [],
        dones: [Task] = [],
        isFormViewOn: Bool = false,
        selectedTask: Task? = nil
    ) {
        self.todos = todos
        self.doings = doings
        self.dones = dones
        self.isFormViewOn = isFormViewOn
        self.selectedTask = selectedTask
    }
    
    func create(new task: Task) {
        todos.append(task)
    }
    
    func presentCreateFormView() {
        isFormViewOn = true
    }
    
    func dismissCreateFormView() {
        isFormViewOn = false
    }
    
    func presentDetailFormView(task: Task) {
        selectedTask = task
    }
    
    func dismissDetailFormView() {
        selectedTask = nil
    }
}


extension KanbanViewModel {
    static let mock = KanbanViewModel (
        todos: [
            Task(title: "제목1", content: "내용", date: .now),
            Task(title: "제목2", content: "내용", date: .now),
            Task(title: "제목3", content: "내용", date: .now),
            Task(title: "제목4", content: "내용", date: .now),
            Task(title: "제목5", content: "내용", date: .now),
        ],
        doings: [
            Task(title: "제목1", content: "내용", date: .now),
            Task(title: "제목2", content: "내용", date: .now),
        ],
        dones: [
            Task(title: "제목1", content: "내용", date: .now),
            Task(title: "제목2", content: "내용", date: .now),
            Task(title: "제목3", content: "내용", date: .now),
        ]
    )
}
