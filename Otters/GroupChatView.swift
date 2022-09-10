import SwiftUI
import UIKit

struct GroupChatView: View {
    @StateObject var groupChatVM = GroupChatViewModel()
    @State var otterUser = 0
    @State var message = ""
    @FocusState private var textFieldIsFocused: Bool
    var body: some View {
        VStack {
            Text(String(otterUser))
            Text("Join Chat")
                .onTapGesture {
                    Task.init {
                        await groupChatVM.createChatClient(otterUser: otterUser % 3)
                        await groupChatVM.createChatThreadClient()
                        await groupChatVM.activateChatListeners()
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
            
            
            Text("Change user")
                .onTapGesture {
                    otterUser += 1
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
