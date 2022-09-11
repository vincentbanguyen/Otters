//
//  JoinGroupChatView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct JoinGroupChatView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let groupIconSize = 80.0
    var body: some View {
        ZStack {
            backgroundBlue
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Button {
                    withAnimation {
                        viewRouter.currentScreen = .groupChatScreen
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 70)
                            .cornerRadius(25)
                            .foregroundColor(primaryButtonColor)
                        Text("Join Support Group")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            }

            VStack(alignment: .center) {
                Text("Otters with Diabetes")
                    .font(.system(size: 40, weight: .medium, design: .rounded))
                    .foregroundColor(.black)
                
                HStack(spacing: -20) {
                    Image(StrawberryOtter22.imageName)
                        .resizable()
                        .frame(width: groupIconSize, height: groupIconSize)
                    Image(BlueberryOtter78.imageName)
                        .resizable()
                        .frame(width: groupIconSize, height: groupIconSize)
                    Image(CherryOtter41.imageName)
                        .resizable()
                        .frame(width: groupIconSize, height: groupIconSize)
                    Image("GrapeOtter32")
                        .resizable()
                        .frame(width: groupIconSize, height: groupIconSize)
                        .foregroundColor(.black)
                }
                .onTapGesture {
                    otterUser += 1
                }
                Text("722 members")
                    .frame(alignment: .center)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    
                Text("Join to get support from your otter peers about diabetes")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .frame(alignment: .center)
                    .foregroundColor(.black)
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
