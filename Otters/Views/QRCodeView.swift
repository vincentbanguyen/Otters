//
//  QRCodeView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI
import CodeScanner

struct QRCodeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var threadCode = ""
    @State var didScan = false
    var body: some View {
        ZStack {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    didScan = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            viewRouter.currentScreen = .joinGroupChatScreen
                        }
                    }
                    threadCode = result.string
                }
            }
            VStack(spacing: 30) {
                Image(systemName: "viewfinder")
                    .font(.system(size: 320, weight: .thin))
                    .opacity(40)
                    .foregroundColor(didScan ? .green : .gray)
                Text("Scan the QR Code provided by your doctor")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            viewRouter.currentScreen = .joinGroupChatScreen
                        }
                    }
            }
        }
        .transition(.backslide)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
