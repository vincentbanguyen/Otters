import SwiftUI
import UIKit

// NOTE: IF messages not popping off, make sure to generate new thread id and load new user tokens + identities
struct GroupChatView: View {
    @StateObject var groupChatVM = GroupChatViewModel()
    @State var otterUser = 0
    @State var message = ""
    @FocusState private var textFieldIsFocused: Bool
    var body: some View {
        VStack {
            Text("Otters with Parkinson's")
            Text(String(otterUser))
            Text("Join Chat")
                .onTapGesture {
                    Task.init {
                        await groupChatVM.createChatClient(otterUser: otterUser % 3)
                        await groupChatVM.createChatThreadClient()
                        await groupChatVM.activateChatListeners()
                    }
                }
            Text("Change user")
                .onTapGesture {
                    otterUser += 1
                }
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(groupChatVM.storedMessages, id: \.id) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .onChange(of: groupChatVM.lastMessageId) { id in
                    // When the lastMessageId changes, scroll to the bottom of the conversation
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
            }
            HStack { // Message View
                ZStack(alignment: .leading) {
                    if message.isEmpty {
                        Text("Message...").opacity(0.5)
                    }
                    TextField("", text: $message, axis: .vertical)
                        .frame(width: 300, height: 40)
                        .accentColor(.yellow)
                        .disableAutocorrection(true)
                        .focused($textFieldIsFocused)
                }
                
                Button {
                    onCommit()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(.brown))
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.gray))
            .cornerRadius(50)
            .padding()
            
            
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
