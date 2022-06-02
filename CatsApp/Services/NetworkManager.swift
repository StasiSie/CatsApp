//
//  NetworkManager.swift
//  CatsApp
//
//  Created by Игорь Богданов on 01.06.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(_ completion: @escaping ([CatFact]) -> Void) {

        let jsonUrl = "https://cat-fact.herokuapp.com/facts"
        guard let url = URL(string: jsonUrl) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }

            do {
                let catFacts = try JSONDecoder().decode([CatFact].self, from: data)
                completion(catFacts)
            } catch let parceError {
                print("Ошибка получения данных:", parceError)
            }
        }.resume()
    }
}




