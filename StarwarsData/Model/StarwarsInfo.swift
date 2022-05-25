//
//  StarwarsInfo.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import Foundation


struct Starwarsinfo: Decodable {
    
    var results: [Results]
    
    
}


struct Results: Decodable {
    
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let gender: String
    
    
    
}
