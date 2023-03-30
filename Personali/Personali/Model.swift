//
//  Model.swift
//  Personali
//
//  Created by Kamil Krzych on 29/03/2023.
//

import Foundation

struct UserResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
