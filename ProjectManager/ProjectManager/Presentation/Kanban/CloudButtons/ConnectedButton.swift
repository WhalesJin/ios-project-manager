//
//  ConnectedButton.swift
//  ProjectManager
//
//  Created by 김민성 on 2023/10/05.
//

import SwiftUI

struct ConnectedButton: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Button {
            userManager.isCloudPopoverOn = true
        } label: {
            Image(systemName: "icloud")
        }
        .popover(isPresented: $userManager.isCloudPopoverOn) {
            VStack(alignment: .trailing, spacing: 10) {
                HStack {
                    Text(userManager.user?.email ?? "")
                        .foregroundColor(.accentColor)
                    Text(" 계정으로 클라우드에 안전하게 보관중입니다.")
                }
                
                Button("로그아웃") {
                    userManager.logout()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct ConnectedButton_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedButton()
    }
}
