//
//  HomePokemon.swift
//  RequestsApp
//
//  Created by Luis Donaldo Galloso Tapia on 31/07/23.
//

import SwiftUI

struct HomePokemon: View {
    @State var timeChange = 30
    @State var timeRemaining = 30
    @ObservedObject  var datos = Peticion()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .top){
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                Image("LogoPokemon")
                    .resizable()
                    .frame(width: 200,height: 150)
                    .padding(.bottom,100)
                HStack(spacing:30){
                    AsyncImage(url: URL(string: datos.url))
                        .frame(width: 100,height: 100)
                        .clipped()
                        .clipShape(Circle())
                        .padding()
                    VStack(spacing:10){
                        Text(datos.name)
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Peso: \(datos.weight) Lb")
                            .bold()
                            .foregroundColor(.white)
                    }.padding()
                    .shadow(radius: 100)
                }.background(Color("PokemonYellow"))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                
                Button(action:{
                    timeRemaining = timeChange
                    datos.GetListPokemon()
                }){
                    Text("Mostrar Pokemón")
                        .font(.callout)
                        .bold()
                        .frame(width: 200,height: 30)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                    
                }.background(Color("PokemonRed"))
                .cornerRadius(50)
                .shadow(radius: 5)
            }
            
        }.onAppear{datos.GetListPokemon()}
        .onReceive(timer) { _ in
                    if timeRemaining == 0 {
                        datos.GetListPokemon()
                        timeRemaining = timeChange
                    }else{
                        timeRemaining -= 1
                    }
        }
    }
}

struct HomePokemon_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemon()
    }
}
