//
//  TaskCellViewModel.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import Foundation

final class TaskCellViewModel: ObservableObject {
    
    func isOverdued(date: Date) -> Bool {
        let calendar = Calendar.current
        let now = Date()
        
        return calendar.compare(date, to: now, toGranularity: .day) == .orderedAscending
    }

}
