//
//  Message.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/9/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var fromUser: Bool
    var senderDisplayName: String
    var imageName: String
}
