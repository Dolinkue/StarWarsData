//
//  StarWarsModel.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import Foundation


struct StarWarsModel: Decodable {
    
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let gender: String
    
}
