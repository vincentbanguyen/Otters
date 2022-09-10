import SwiftUI
import UIKit

// NOTE: IF messages not popping off, make sure to generate new thread id and load new user tokens + identities
struct GroupChatView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var groupChatVM = GroupChatViewModel()
    @State var message = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Otters with Diabetes")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .frame(height: 80)
                
                
                ScrollView {
                    Text("")
                    ForEach(groupChatVM.storedMessages, id: \.id) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .background(Color(hex: 0xfafafa))
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(backgroundBlue)
            
            HStack { // Message View
                ZStack(alignment: .leading) {
                    if message.isEmpty {
                        Text("Message...").opacity(0.5)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                    }
                    TextField("", text: $message, axis: .vertical)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .frame(width: 280, height: 30)
                        .accentColor(Color(hex: 0x85c8e9))
                        .disableAutocorrection(true)
                        .focused($textFieldIsFocused)
                }
                
                Button {
                    onCommit()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color(hex: 0xfafafa))
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .padding(10)
                        .background(Color(hex: 0x1aa3e9))
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color(hex: 0xdbdbdb))
            .cornerRadius(30)
            .padding()
        }
        .onAppear {
            Task.init {
                await groupChatVM.createChatClient(otterUser: otterUser % 3)
                await groupChatVM.createChatThreadClient()
                await groupChatVM.activateChatListeners()
            }
        }
    }
    
    func onCommit() -> Void {
        if !message.isEmpty {
            textFieldIsFocused = false
            print("PROGRESS: Attempting to send: \(message)")
            groupChatVM.sendMessage(content: message)
            message = ""
        }
    }
}

struct GroupChatView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatView()
    }
}
