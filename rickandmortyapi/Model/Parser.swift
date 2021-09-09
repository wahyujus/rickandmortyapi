//
//  Parser.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import Foundation

struct Parser {
    private var dataTask: URLSessionDataTask?
    
    mutating func getrickandmortyAPI(comp : @escaping ([Result])->()){
        
        let rickandmortyAPI = "https://rickandmortyapi.com/api/character"
        let api = URL(string: rickandmortyAPI)
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: api!){
            data, response, error in
            
            // Handle Error
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do{
                // Parse the data
                let decoder = JSONDecoder()
                let result = try decoder.decode(CharacterModel.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    comp(result.results)
                }
            } catch let error{
                print(error.localizedDescription)
            }
            
        }
        dataTask?.resume()
    }
}
