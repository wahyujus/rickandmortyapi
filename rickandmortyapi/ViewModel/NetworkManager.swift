//
//  NetworkManager.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://rickandmortyapi.com/api/"
    let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getCharacters(completed: @escaping (Result<CharacterModel, RMError>) -> Void){
        let endpoint = baseURL + "character"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characters = try decoder.decode(CharacterModel.self, from: data)
                completed(.success(characters))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getUserInfo(for id: String, completed: @escaping (Result<SingleCharacter, RMError>) -> Void){
        let endpoint = baseURL + "character/\(id)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(SingleCharacter.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
}
