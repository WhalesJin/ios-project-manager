//
//  CustomAlert.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import SwiftUI

struct CustomBoolAlert<Alert: View>: ViewModifier {
    @Binding var isOn: Bool
    let title: String
    let alertView: Alert
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isOn {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                NavigationStack {
                    alertView
                        .navigationTitle(title)
                        .navigationBarTitleDisplayMode(.inline)
                }                
                .cornerRadius(10)
                .frame(width: 500, height: 600)
            }
        }
    }
}

struct CustomValueAlert<T, Alert: View>: ViewModifier {
    @Binding var value: T?
    let title: String
    let alertView: Alert
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if value != nil {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                NavigationStack {
                    alertView
                        .navigationTitle(title)
                        .navigationBarTitleDisplayMode(.inline)
                }
                .cornerRadius(10)
                .frame(width: 500, height: 600)
            }
        }
    }
}

extension View {
    func customAlert<Alert: View>(
        isOn: Binding<Bool>,
        title: String,
        alertView: @escaping () -> Alert
    ) -> some View {
        modifier(
            CustomBoolAlert(
                isOn: isOn,
                title: title,
                alertView: alertView()
            )
        )
    }
    
    func customAlert<T, Alert: View>(
        selected: Binding<T?>,
        title: String,
        alertView: @escaping () -> Alert
    ) -> some View {
        modifier(
            CustomValueAlert(
                value: selected,
                title: title,
                alertView: alertView()
            )
        )
    }
}
