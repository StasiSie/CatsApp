//
//  Url.swift
//  CatsApp
//
//  Created by Игорь Богданов on 01.06.2022.
//

import Foundation

class UrlManager {
   
    static var shared = UrlManager()
   
    private init() {}
    
    var tag: Tag?
    var filter: Filter?
    var urlLink: String {
        "https://cataas.com/cat\(tag?.rawValue ?? "")\(filter?.rawValue ?? "")"
    }
    
}

enum Tag: String {
    case none = ""
    case cute = "/cute"
    case angry = "/angry"
    case confused = "/confused"
    case fluffy = "/fluffy"
}

enum Filter: String {
    case none = ""
    case sepia = "?filter=sepia"
    case bokeh = "?filter=bokeh"
    case typography = "?filter=typography"
    case street = "?filter=street"
}
