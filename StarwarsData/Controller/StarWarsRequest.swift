//
//  StarWarsRequest.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import Foundation



struct Service {
    static let shared = Service()
    
    func fechData(completion: @escaping(Starwarsinfo) -> ()) {
        
        guard let url = URL(string: "https://swapi.dev/api/people") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                
                let starwarsData = try JSONDecoder().decode(Starwarsinfo.self, from: data)
                DispatchQueue.main.async {
                    
                    
                    completion(starwarsData)
                    
                }
                
                
            } catch {
                
                let error = error
                print(error)
                
                
            }
            
        }.resume()
    }
}
