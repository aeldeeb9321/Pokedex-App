//
//  PokemonViewModel.swift
//  PokedexUI
// 
//  Created by Ali Eldeeb on 6/23/22.
//

import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    //Creating a URL request to retrieve all the data from baseUrl, then we are going to map all that incoming data into an array of pokemon.
    func fetchPokemon(){
        //reaches out to the API
        guard let url = URL(string: baseUrl) else{return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //Parses the API data for us so it gives it back to us in the right format
            guard let data = data?.parseData(removeString: "null,") else {return}
            // In the guard statement it uses the API data, then use the JSON decoder to give us back an array of pokemon
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else{return}
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor{
        switch type{
        case "fire": return .systemRed
        case "water": return .systemBlue
        case "poison": return .systemGreen
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemGray
        case "ground": return .systemOrange
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
}

extension Data{
    func parseData(removeString string: String) -> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else{return nil}
        return data
    }
}
