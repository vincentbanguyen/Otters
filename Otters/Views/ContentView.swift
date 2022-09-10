//
//  ContentView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        ZStack {
            switch viewRouter.currentScreen {
            case Screen.loadingScreen:
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                viewRouter.currentScreen = .welcomeScreen
                            }
                        }
                    }
            case Screen.welcomeScreen:
                WelcomeView()
            case Screen.qrScreen:
                QRCodeView()
            case Screen.joinGroupChatScreen:
                JoinGroupChatView()
            case Screen.groupChatScreen:
                GroupChatView()
            }
        }
        .environmentObject(viewRouter)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
