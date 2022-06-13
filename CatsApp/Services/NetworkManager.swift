//
//  NetworkManager.swift
//  CatsApp
//
//  Created by Игорь Богданов on 01.06.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    let jsonUrl = "https://cat-fact.herokuapp.com/facts"
    
    private init() {}
    
    func fetchData(_ completion: @escaping ([CatFact]) -> Void) {
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
     
    func fetchDataWithAlamofire(_ completion: @escaping(CatFact) -> Void) {
        AF.request(jsonUrl)
            .validate()
            .responseJSON { dataResponse in
                
                guard  let catFactsData = dataResponse.value as? [[String:Any]] else {return}
                let catFact = CatFact(value: catFactsData.randomElement() ?? [:])
                print(catFact)
                completion(catFact)
                }
            }
        
    }
                          

