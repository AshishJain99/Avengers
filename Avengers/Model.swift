//
//  model.swift
//  Avengers
//
//  Created by sixpep on 04/02/23.
//

import Foundation

// MARK: - WelcomeElement
struct jsonStruct: Codable {
    let name, realname, team, firstappearance: String?
    let createdby, publisher: String?
    let imageurl: String?
    let bio: String?
}

//typealias Welcome = [WelcomeElement]
