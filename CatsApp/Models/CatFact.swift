//
//  CatFact.swift
//  CatsApp
//
//  Created by Игорь Богданов on 01.06.2022.
//

import Foundation

struct CatFact: Decodable {
    let status: Status?
    let id, user, text: String?
    let v: Int?
    let source, updatedAt, type, createdAt: String?
    let deleted, used: Bool?
}

struct Status: Decodable {
    let verified: Bool?
    let sentCount: Int?
}


