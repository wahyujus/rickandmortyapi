//
//  Parser.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import Foundation

struct Parser {
    func parse(){
        let api = URL(string: "https://rickandmortyapi.com/api/character")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
            let result = try JSONDecoder().decode(Result.self, from: data!)
                print(result)
            } catch{
                
            }
            
        }
    }
}
