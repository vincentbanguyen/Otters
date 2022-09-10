//
//  JoinGroupChatView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct JoinGroupChatView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            backgroundBlue
                .ignoresSafeArea()
            VStack {
                Text("Otters with Parkinson's")
                Text("722 members")
                    .onTapGesture {
                        otterUser += 1
                    }
                
                Text("Join to get support from your otter peers about Parkinson's Disease")
                
                Button {
                    withAnimation {
                        viewRouter.currentScreen = .groupChatScreen
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 50)
                            .cornerRadius(25)
                            .foregroundColor(.green)
                        Text("Join")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .transition(.backslide)
    }
}

struct JoinGroupChatView_Previews: PreviewProvider {
    static var previews: some View {
        JoinGroupChatView()
    }
}
