//
//  CustomAlert.swift
//  ProjectManager
//
//  Created by Minsup & Whales on 2023/09/21.
//

import SwiftUI

struct CustomBoolAlert<AlertContent: View>: ViewModifier {
    @Binding var isOn: Bool
    let title: String
    let alertContent: AlertContent
    
    @ObservedObject var keyboard = KeyboardManager()
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            let width = geo.size.width * 0.5
            let height = geo.size.height * 0.8 + (keyboard.height * 0.8)
            
            ZStack {
                content
                if isOn {
                    bluredBackground
                    ScrollView(showsIndicators: false) {
                        alertView
                            .frame(width: width, height: height)
                    }
                    .scrollDisabled(keyboard.height == .zero)
                }
            }
        }
    }
    
    var alertView: some View {
        NavigationStack {
            alertContent
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
        .cornerRadius(10)
    }
    
    var bluredBackground: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .onTapGesture {
                guard keyboard.height == .zero else {
                    keyboard.hide()
                    return
                }
                
                isOn = false
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
                    .onTapGesture {
                        value = nil
                    }
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
        content: @escaping () -> Alert
    ) -> some View {
        modifier(
            CustomBoolAlert(
                isOn: isOn,
                title: title,
                alertContent: content()
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
