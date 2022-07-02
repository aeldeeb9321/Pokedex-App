//
//  Pokemon.swift
//  PokedexUI
//
//  Created by Ali Eldeeb on 6/23/22.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type:String
//    let height, attack, defense, weight, total: Int
//    let description: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 1, name: "Ivysaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 2, name: "Venasaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 3, name: "Charmander", imageUrl: "Bulbasaur", type: "fire"),
    .init(id: 4, name: "Charmeleon", imageUrl: "Bulbasaur", type: "fire"),
    .init(id: 5, name: "Charizard", imageUrl: "Bulbasaur", type: "fire")
]
