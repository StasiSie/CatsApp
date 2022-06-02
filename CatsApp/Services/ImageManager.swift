//
//  ImageManager.swift
//  CatsApp
//
//  Created by Игорь Богданов on 02.06.2022.
//

import Foundation

class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage( from url: String?) -> Data? {
        guard let urlString = url else {return nil}
        guard let imageUrl = URL(string: urlString) else {return nil}
        let image = try? Data(contentsOf: imageUrl)
        return image
    }
    
}
