import AzureCommunicationChat
import AzureCommunicationCommon

import Foundation
import SwiftUI

class GroupChatViewModel: ObservableObject {
    let semaphore = DispatchSemaphore(value: 0)
    var chatClient: ChatClient?
    var chatThreadClient: ChatThreadClient?
    var userDisplayName = ""
    @Published var storedMessages: [Message] = [Message(text: "Hello everyone!", fromUser: false, senderDisplayName: "GrapeOtter32", imageName: "GrapeOtter32")]
    @Published private(set) var lastMessageId: String = ""
    /*
     ChatClient: This class is needed for the chat functionality. You instantiate it with your subscription information,
     and use it to create, get, delete threads, and subscribe to chat events.
     */
    func createChatClient(otterUser: Int) async {
        do {
            let endpoint = "https://ottersresource.communication.azure.com/"
            var token = ""
            switch otterUser {
            case 0:
                token = StrawberryOtter22.accessToken
                userDisplayName = StrawberryOtter22.displayName
            case 1:
                token = BlueberryOtter78.accessToken
                userDisplayName = BlueberryOtter78.displayName
            case 2:
                token = CherryOtter41.accessToken
                userDisplayName = CherryOtter41.displayName
            default:
                token = StrawberryOtter22.accessToken
                userDisplayName = StrawberryOtter22.displayName
            }
            let credential =
            try CommunicationTokenCredential(
                token: token
            )
            let options = AzureCommunicationChatClientOptions()
            
            self.chatClient = try ChatClient(
                endpoint: endpoint,
                credential: credential,
                withOptions: options
            )
            print("PROGRESS: Chat Client successfully created")
        } catch {
            print("creating client failed: \(error.localizedDescription)")
        }
    }
    
    /*
     This class is needed for the chat thread functionality. You obtain an instance via ChatClient, and use it to send,
     receive, update, and delete messages. You can also use it to add, remove, and get users,
     send typing notifications and read receipts.
     */
    func createChatThread() async {
        let request = CreateChatThreadRequest(
            topic: "Quickstart",
            participants: [
                ChatParticipant(
                    id: CommunicationUserIdentifier(StrawberryOtter22.identity),
                    displayName: StrawberryOtter22.displayName
                ),
                ChatParticipant(
                    id: CommunicationUserIdentifier(BlueberryOtter78.identity),
                    displayName: BlueberryOtter78.displayName
                ),
                ChatParticipant(
                    id: CommunicationUserIdentifier(CherryOtter41.identity),
                    displayName: CherryOtter41.displayName
                )
            ]
        )
        
        guard let chatClient = self.chatClient else { return }
        chatClient.create(thread: request) { [self] result, _ in
            switch result {
            case let .success(result):
                // self.threadId = result.chatThread?.id
                 print("PROGRESS: Chat Thread successfully created with threadID: \(result.chatThread?.id)")
                
            case .failure:
                fatalError("Failed to create thread.")
            }
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    func listChatThreads() {
        DispatchQueue.global(qos: .background).async { [self] in
            guard let chatClient = self.chatClient else { return }
            chatClient.listThreads { [self] result, _ in
                switch result {
                case let .success(threads):
                    guard let chatThreadItems = threads.pageItems else {
                        print("No threads returned.")
                        return
                    }
                    
                    for chatThreadItem in chatThreadItems {
                        print("Thread id: \(chatThreadItem.id)")
                    }
                case .failure:
                    print("Failed to list threads")
                }
                semaphore.signal()
            }
            semaphore.wait()
        }
    }
    
    func createChatThreadClient() async {
        do {
            guard let chatClient = self.chatClient else { return }
            self.chatThreadClient = try chatClient.createClient(forThread: threadId)
            print("PROGRESS: creating chat thread client success")
        } catch {
            print("creating chat thread client failed: \(error.localizedDescription)")
        }
    }
    
    func sendMessage(content: String) {
        DispatchQueue.global(qos: .background).async { [self] in
            let message = SendChatMessageRequest(
                content: content,
                senderDisplayName: userDisplayName,
                type: .text
            )
            
            guard let chatThreadClient = self.chatThreadClient else { return }
            chatThreadClient.send(message: message) { [self] result, _ in
                switch result {
                case let .success(result):
                    print("Message sent, message id: \(result.id)")
                case .failure:
                    print("Failed to send message")
                }
                semaphore.signal()
            }
            semaphore.wait()
        }
    }
    
    func activateChatListeners() async {
        
        guard let chatClient = self.chatClient else { return }
        chatClient.startRealTimeNotifications { [self] result in
            switch result {
            case .success:
                print("PROGRESS: Real-time notifications started.")
            case .failure:
                print("Failed to start real-time notifications.")
            }
            semaphore.signal()
        }
        semaphore.wait()
        
        chatClient.register(event: .chatMessageReceived, handler: { [self] response in
            switch response {
            case let .chatMessageReceivedEvent(event):
                print("PROGRESS: Received a message: \(event.message)")
                print("PROGRESS: from: \(event.senderDisplayName!)")
                let message = Message(
                    text: event.message,
                    fromUser: event.senderDisplayName == userDisplayName,
                    senderDisplayName: event.senderDisplayName!,
                    imageName: event.senderDisplayName!
                )
                DispatchQueue.main.async { [self] in
                    if event.senderDisplayName != userDisplayName {
                        storedMessages.append(message)
                    }
                    lastMessageId = event.id
                }
            default:
                return
            }
        })
    }
}
