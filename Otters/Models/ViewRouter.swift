//
//  ViewRouter.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentScreen: Screen = .loadingScreen
}

enum Screen {
    case loadingScreen
    case welcomeScreen
    case qrScreen
    case joinGroupChatScreen
    case groupChatScreen
    case infoScreen
}
