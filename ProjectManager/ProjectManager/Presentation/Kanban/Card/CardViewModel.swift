//
//  TaskCellViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import Foundation

struct CardViewModel {
    
    let task: Task
    
    var date: String {
        return task.date.formatted(date: .numeric, time: .omitted)
    }
    
    var isOverdued: Bool {
        let calendar = Calendar.current
        let now = Date()
        
        return calendar.compare(task.date, to: now, toGranularity: .day) == .orderedAscending
    }
}
