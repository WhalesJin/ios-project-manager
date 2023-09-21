//
//  ProjectManagerApp.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/19.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct ProjectManagerApp: App {
    
    @ObservedObject var kanbanViewModel = KanbanViewModel()
    
    var body: some Scene {
        WindowGroup {
            KanbanView()
                .environmentObject(kanbanViewModel)
        }
    }
}
