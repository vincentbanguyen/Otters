//
//  MessageBubbleView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import SwiftUI

struct MessageBubbleView: View {
    var message: Message
    
    let userColor = Color(hex: 0xad7a53, opacity: 1)
    let otherColor = Color(hex: 0xddbda1, opacity: 1)
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                if message.fromUser {
                    Spacer()
                }
                Text(message.senderDisplayName)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                if !message.fromUser {
                    Spacer()
                }
            }
            .padding(.horizontal, 18)
            HStack(spacing: 0) {
                if message.fromUser {
                    Spacer()
                } else {
                    Image(message.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(10)
                }
                VStack {
                    VStack(spacing: -10) {
                        Rectangle()
                            .frame(width: 10, height: 20)
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: 30))
                            .rotation3DEffect(Angle(degrees: message.fromUser ? 0 : 180), axis: (x: 1, y: 0, z: 0))
                            .foregroundColor(message.fromUser ? userColor : otherColor)
                            .offset(x: CGFloat(message.fromUser ? -message.text.count * 2 : message.text.count * 2))
                        
                        Text(message.text)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .padding()
                            .background(message.fromUser ? userColor : otherColor)
                            .cornerRadius(30)
                        Rectangle()
                            .frame(width: 10, height: 20)
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: 30))
                            .rotation3DEffect(Angle(degrees: message.fromUser ? 0 : 180), axis: (x: 1, y: 0, z: 0))
                            .foregroundColor(message.fromUser ? userColor : otherColor)
                            .offset(x: CGFloat(message.fromUser ? message.text.count * 2 : -message.text.count * 2))
                    }
                    .frame(maxWidth: 300, alignment: message.fromUser ? .trailing : .leading)
                }
                if message.fromUser {
                    Image(message.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(10)
                } else {
                    Spacer()
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageBubbleView(message: Message(id: "0", text: "How are you doing?", fromUser: true, senderDisplayName: StrawberryOtter22.displayName, imageName: StrawberryOtter22.imageName))
            MessageBubbleView(message: Message(id: "1", text: "I'm doing ehhh", fromUser: false, senderDisplayName: BlueberryOtter78.displayName, imageName: BlueberryOtter78.imageName))
        }
    }
}
