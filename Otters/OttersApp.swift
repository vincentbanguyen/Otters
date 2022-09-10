//
//  OttersApp.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

@main
struct OttersApp: App {
    @State var loadingDone = false
    var body: some Scene {
        WindowGroup {
            if loadingDone == false {
            LoadingView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        loadingDone = true
                    }
                }
            } else {
                ContentView()
            }
        }
    }
}
