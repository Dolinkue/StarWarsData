//
//  StarwarsInfo.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import Foundation


struct ResultsData: Decodable {
    
    let results: [Results]
    
    
}


struct Results: Decodable {
    
    let name: String
    let height: Int
    let mass: Int
    let hair_color: String
    let skin_color: String
    let gender: String
    
    
    
}
