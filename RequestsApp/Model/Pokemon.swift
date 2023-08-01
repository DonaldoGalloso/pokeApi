//
//  Pokemon.swift
//  RequestsApp
//
//  Created by Luis Donaldo Galloso Tapia on 31/07/23.
//

import Foundation

struct Pokemon: Codable {
    var name : String
    var sprites: PokemonSprites
    var weight : Int
}

struct PokemonSprites: Codable {
    var front_default : String
}


