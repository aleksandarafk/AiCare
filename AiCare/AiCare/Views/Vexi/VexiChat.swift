//
//  VexiChat.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI
import Combine

struct VexiChat: View {
    @State private var selectedLanguage: Int = {
        let languageCode = Locale.current.languageCode
        if languageCode == "bg" {
            return 1
        } else if languageCode == "nl" {
            return 2
        } else {
            return 0
        }
    }()
    let languages = ["en", "bg", "nl"]
    @State var messageText: String = ""
    @State var chatMessages: [ChatMessages] = []
    let openAIService = OpenAIService()
    @State var cancellables =  Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack {
                        ForEach(chatMessages, id:\.id){ message in
                            messageView(message:message)
                        }
                    }
                }
                
                HStack{
                    TextField("question".localizableString(languages[selectedLanguage]), text: $messageText)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(12)
                    
                    Button{
                        sendMessage()
                    } label: {
                        Text("send".localizableString(languages[selectedLanguage]))
                            .foregroundColor(.blue)
                            .padding()
                            .cornerRadius(12)
                    }
                }
            }
            .navigationBarTitle("Vexi", displayMode: .inline)
            .padding()
            .onAppear {
                // Add a static message when the view first appears
                let staticMessage = ChatMessages.sampleMessage
                chatMessages.append(contentsOf: staticMessage)
            }
        }
    }
    
    func messageView(message: ChatMessages) -> some View{
        HStack{
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(15)
            if message.sender == .vexi {Spacer()}
        }
    }
    
    func sendMessage() {
        let myMessage = ChatMessages(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink { completion in
            //
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
            let vexiMessage = ChatMessages(id: response.id, content: textResponse, dateCreated: Date(), sender: .vexi)
            chatMessages.append(vexiMessage)
        }
        .store(in: &cancellables)
        messageText = ""
        print(messageText)
    }
}

struct ChatMessages{
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case vexi
}

extension ChatMessages{
    static let sampleMessage = [        ChatMessages(id: UUID().uuidString, content: "Hello, I am Vexi! I am designed to give you advices, if you are feeling sick or you are not sure of what you should do. Ask something like 'I think, that I have a cold, what should I do?' to get started.", dateCreated: Date(), sender: .vexi)
    ]
}


struct VexiChat_Previews: PreviewProvider {
    static var previews: some View {
        VexiChat()
    }
}

