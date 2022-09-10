//
//  WelcomeView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("To ensure privacy, we give everyone an anonymous username.")
                .font(.system(size: 20, weight: .medium, design: .rounded))
            Text("Your's is:")
                .font(.system(size: 20, weight: .medium, design: .rounded))
            Text(StrawberryOtter22.displayName)
                .font(.system(size: 20, weight: .medium, design: .rounded))
            // Image Icon
            Text("Welcome!")
                .font(.system(size: 20, weight: .medium, design: .rounded))
        }
        .background(Color(hex: 0xdbdbdb))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
