//
//  Message.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    var text: String
    var fromUser: Bool
    var senderDisplayName: String
    var imageName: String
}
