//
//  CustomAlert.swift
//  ProjectManager
//
//  Created by Whales on 10/2/23.
//

import SwiftUI

struct CustomAlert<Alert: View, T>: ViewModifier {
    @EnvironmentObject var keyboard: KeyboardManager
    @Binding var item: T?
    @Binding var isOn: Bool
    let alertView: Alert
    func body(content: Content) -> some View {
        ZStack {
            content
            if item != nil || isOn {
                bluredBackground
                alertView
            }
        }
    }

    var bluredBackground: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .onTapGesture {
                if keyboard.isVisible {
                    keyboard.hide()
                } else {
                    item = nil
                    isOn = false
                }
            }
    }
}

extension View {
    func customAlert<Alert: View, T>(
        viewModel: Binding<KanbanViewModel>,
        alertView: @escaping () -> Alert
    ) -> some View {
        modifier(
            CustomAlert(
                item: viewModel.selectedTask,
                isOn: viewModel.isFormOn,
                alertView: alertView()
            )
        )
        
        
//        if let isOn = isOn {
//            modifier(
//                IsOnCustomAlert(
//                    isOn: isOn,
//                    alertView: alertView()
//                )
//            )
//        } else {
//            modifier(
//                ItemCustomAlert(
//                    item: item,
//                    alertView: alertView()
//                )
//            )
//        }
//
//        if let isOn = isOn {
//            return customAlert(isOn: isOn, alertView: alertView)
//        } else {
//            return customAlert(item: item, alertView: alertView)
//        }
//
    }
}
