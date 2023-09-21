//
//  Task.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date
    var state: TaskState
}

enum TaskState: Int {
    case todo = 1
    case doing = 2
    case done = 3
}
