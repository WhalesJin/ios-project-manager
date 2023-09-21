//
//  TodoView.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/20.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var vm: ViewModel
    
    init(vm: ViewModel = ViewModel()) {
        self.vm = vm
        NavigationBarConfig
            .config(backgroundColor: .systemBackground)
    }
    
    var body: some View {        
        NavigationView {
            HStack {
                ListView(tasks: vm.todos, title: "TODO")
                ListView(tasks: vm.doings, title: "DOING")
                ListView(tasks: vm.dones, title: "DONE")
            }
            .navigationTitle("Project Manager")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.showingAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .customAlert(isOn: $vm.showingAddView, title: "Todo") {
            TaskAddView()
        } leftButton: {
            Button("Cancel") {
                vm.showingAddView = false
            }
        } rightButton: {
            Button("Done") {
                vm.showingAddView = false
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(vm: TodoView.ViewModel.mock)
    }
}
