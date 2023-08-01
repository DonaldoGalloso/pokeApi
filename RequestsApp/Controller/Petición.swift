//
//  Petición.swift
//  RequestsApp
//
//  Created by Luis Donaldo Galloso Tapia on 31/07/23.
//

import Foundation

class Peticion : ObservableObject{
    
    
    @Published var name = ""
    @Published var url = ""
    @Published var weight :Int = 0
    
    
    func GetListPokemon(){
        let baseURL = "https://pokeapi.co/api/v2/pokemon/"
        let randomInt = Int.random(in: 1..<151)
        let urlPeticion = URL(string: baseURL + String(randomInt))
        var urlRequest = URLRequest(url: urlPeticion!)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data , response, error ) in
            
            guard let data = data else {return}
            
            do{
                let json = try JSONDecoder().decode(Pokemon.self, from: data  )
                DispatchQueue.main.async {
                    self.url = json.sprites.front_default
                    self.name = json.name
                    self.weight = json.weight
                }
            }catch{
                print(error)
            }
            
        }.resume()
    }
    
}
