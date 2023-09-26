//
//  EditTaskViewModel.swift
//  ProjectManager
//
//  Created by Whales on 9/27/23.
//

import SwiftUI

final class EditTaskViewModel: ObservableObject {
    @Published var task: Task
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var date: Date = Date()
    
    var formTitle: String {
        task.state.title
    }
    
    private let formSize: CGSize
    
    init(task: Task, formSize: CGSize) {
        self.task = task
        self.formSize = formSize
    }
    
    var formWidth: CGFloat {
        formSize.width * 0.45
    }
    
    var formHeight: CGFloat {
        return formSize.width * 0.6
    }
}
