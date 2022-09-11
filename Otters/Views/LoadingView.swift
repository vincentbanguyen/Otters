//
//  LoadingView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            backgroundBlue
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Image("LoadingIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Loading...")
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(.black)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
