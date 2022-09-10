import SwiftUI

struct GroupChatView: View {
    @StateObject var groupChatVM = GroupChatViewModel()
    @State var otterUser = 0
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
    
            Text("send message")
                .onTapGesture {
                    groupChatVM.sendMessage(content: "HELLOOOOO")
                }
            Text("Change user")
                .onTapGesture {
                    otterUser += 1
                }
        }
    }
}
