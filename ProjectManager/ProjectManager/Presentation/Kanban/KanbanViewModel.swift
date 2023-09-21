//
//  KanbanViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//
import SwiftUI


final class KanbanViewModel: ObservableObject {
    @Published var tasks: [Task]
    
    @Published var isFormViewOn: Bool
    @Published var selectedTask: Task?
    
    var todoTasks: [Task] {
        tasks.filter { $0.state == .todo }
    }
    
    var doingTasks: [Task] {
        tasks.filter { $0.state == .doing }
    }
    
    var doneTasks: [Task] {
        tasks.filter { $0.state == .done}
    }
    
    init(
        tasks: [Task] = [],
        isFormViewOn: Bool = false,
        selectedTask: Task? = nil
    ) {
        self.tasks = tasks
        self.isFormViewOn = isFormViewOn
        self.selectedTask = selectedTask
    }
    
    func create(new task: Task) {
        tasks.append(task)
    }
    
    func update(updatedTask: Task) {
        guard let index = tasks.firstIndex(where: { task in
            task.id == updatedTask.id
        }) else { return }
        
        tasks[index] = updatedTask        
    }
    
    func delete(_ target: Task) {
        tasks.removeAll { task in
            task.id == target.id
        }
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
        tasks: [
            Task(title: "제목1", content: "내용", date: .now, state: .todo),
            Task(title: "제목2", content: "내용", date: .now, state: .todo),
            Task(title: "제목3", content: "내용", date: .now, state: .todo),
            Task(title: "제목4", content: "내용", date: .now, state: .doing),
            Task(title: "제목5", content: "내용", date: .now, state: .doing),
            Task(title: "제목6", content: "내용", date: .now, state: .done),
            Task(title: "제목7", content: "내용", date: .now, state: .done),
            Task(title: "제목8", content: "내용", date: .now, state: .done),
        ]
    )
}
