//
//  WelcomeView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            backgroundBlue
                .ignoresSafeArea()
            VStack {
                Text("To ensure patient privacy, we give everyone an anonymous username.")
                    .padding(10)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.black)
                Spacer()
                Button {
                    withAnimation {
                        viewRouter.currentScreen = .qrScreen
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 70)
                            .cornerRadius(25)
                            .foregroundColor(primaryButtonColor)
                        Text("Get Started")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            }
            VStack {
                VStack(alignment: .leading) {
                    Text("Welcome,")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                    Text("StrawberryOtter22!")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                }
                Image(StrawberryOtter22.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
              
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
