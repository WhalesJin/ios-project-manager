//
//  CustomAlert.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import SwiftUI

struct CustomAlert<Alert: View, Button: View>: ViewModifier {
    @Binding var isOn: Bool
    let title: String
    let alertView: Alert
    let leftButton: Button
    let rightButton: Button
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isOn {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                NavigationView {
                    alertView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                leftButton
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                rightButton
                            }
                        }
                        .navigationTitle(title)
                        .navigationBarTitleDisplayMode(.inline)
                }
                .navigationViewStyle(.stack)
                .cornerRadius(10)
                .frame(width: 400, height: 500)
                .onAppear {
                    NavigationBarConfig
                        .config(backgroundColor: .tertiarySystemGroupedBackground)
                }
            }
        }
    }
}

extension View {
    func customAlert<Alert: View, Button: View>(
        isOn: Binding<Bool>,
        title: String,
        alertView: @escaping () -> Alert,
        leftButton: @escaping () -> Button,
        rightButton: @escaping () -> Button
    ) -> some View {
        modifier(
            CustomAlert(
                isOn: isOn,
                title: title,
                alertView: alertView(),
                leftButton: leftButton(),
                rightButton: rightButton()
            )
        )
    }
}
