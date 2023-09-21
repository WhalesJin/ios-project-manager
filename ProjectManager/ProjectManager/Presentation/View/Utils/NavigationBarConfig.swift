//
//  VisibleNaviBar.swift
//  ProjectManager
//
//  Created by 김민성 on 2023/09/21.
//

import UIKit

struct NavigationBarConfig {    
    static func config(backgroundColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

