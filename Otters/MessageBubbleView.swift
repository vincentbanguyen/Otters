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
        
        VStack(spacing: 5) {
            HStack {
                if !message.fromUser {
                    Spacer()
                }
                Text(message.senderDisplayName)
                if message.fromUser {
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            HStack {
                if !message.fromUser {
                    Spacer()
                }
                
                VStack {
                    VStack(spacing: -10) {
                        Rectangle()
                            .frame(width: 10, height: 20)
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: 30))
                            .rotation3DEffect(Angle(degrees: message.fromUser ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                            .foregroundColor(message.fromUser ? otherColor : userColor)
                            .offset(x: CGFloat(message.fromUser ? message.text.count * 2 : -message.text.count * 2))
                        
                        Text(message.text)
                            .padding()
                            .background(message.fromUser ? otherColor : userColor)
                            .cornerRadius(30)
                        Rectangle()
                            .frame(width: 10, height: 20)
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: 30))
                            .rotation3DEffect(Angle(degrees: message.fromUser ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                            .foregroundColor(message.fromUser ? otherColor : userColor)
                            .offset(x: CGFloat(message.fromUser ? -message.text.count * 2 : message.text.count * 2))
                    }
                    .frame(maxWidth: 300, alignment: message.fromUser ? .leading : .trailing)
                    .padding(.horizontal)
                }
                if message.fromUser {
                    Spacer()
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageBubbleView(message: Message(id: "0", text: "How are you doing?", fromUser: true, senderDisplayName: StrawberryOtter22.displayName))
            MessageBubbleView(message: Message(id: "1", text: "I'm doing ehhh", fromUser: false, senderDisplayName: BlueBerryOtter78.displayName))
        }
    }
}
