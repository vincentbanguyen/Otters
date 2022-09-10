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
            Text("HEllo")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
