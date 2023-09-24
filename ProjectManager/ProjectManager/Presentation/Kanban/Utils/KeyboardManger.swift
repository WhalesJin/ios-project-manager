//
//  KeyboardManger.swift
//  ProjectManager
//
//  Created by 김민성 on 2023/09/25.
//

import SwiftUI
import Combine

class KeyboardManager: ObservableObject {
    @Published var height: CGFloat = 0
    
    var keyboardShowCancellable: Cancellable?
    var keyboardHideCancellable: Cancellable?
    
    init() {
        keyboardShowCancellable = NotificationCenter.default
            .publisher(for: UIWindow.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                
                guard let userInfo = notification.userInfo else { return }
                guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                withAnimation {
                    self.height = keyboardFrame.height
                }
            }
        
        keyboardHideCancellable = NotificationCenter.default
            .publisher(for: UIWindow.keyboardWillHideNotification)
            .sink { [weak self] _ in
                guard let self = self else { return }
                withAnimation {
                    self.height = 0
                }                
            }
    }
    
    func hide() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }    
}
