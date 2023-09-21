//
//  TaskCellViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import Foundation

struct TaskCellViewModel {
    
    let task: Task
    
    var date: String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "YYYY. M. d"        
        return formatter.string(from: task.date)
    }
    
    var isOverdued: Bool {
        let calendar = Calendar.current
        let now = Date()
        
        return calendar.compare(task.date, to: now, toGranularity: .day) == .orderedAscending
    }
}
