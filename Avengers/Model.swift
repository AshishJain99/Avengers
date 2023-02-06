//
//  model.swift
//  Avengers
//
//  Created by Ash on 04/02/23.
//

import Foundation

// MARK: - Model
struct jsonStruct: Codable {
    let name, realname, team, firstappearance: String?
    let createdby, publisher: String?
    let imageurl: String?
    let bio: String?
}

