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
    
    init(value: [String:Any]) {
        let statusDict = value["status"] as? [String:Any] ?? [:]
        status = Status(value: statusDict)
        
        id = value["id"] as? String
        user = value["user"] as? String
        text = value["text"] as? String
        v = value["v"] as? Int
        source = value["source"] as? String
        updatedAt = value["updatedAt"] as? String
        type = value["type"] as? String
        createdAt = value["createdAt"] as? String
        deleted = value["deleted"] as? Bool
        used = value["used"] as? Bool
    }
}

struct Status: Decodable {
    let verified: Bool?
    let sentCount: Int?
    
    init(value: [String:Any]) {
        verified = value["verified"] as? Bool
        sentCount = value["sentCount"] as? Int
    }
}


