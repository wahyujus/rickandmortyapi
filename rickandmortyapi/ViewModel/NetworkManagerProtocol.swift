//
//  NetworkManagerProtocol.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import Foundation

protocol NetworkManagerProtocol {
    func getCharacters(completed: @escaping (Result<CharacterModel, RMError>) -> Void)
    func getUserInfo(for id: String, completed: @escaping (Result<SingleCharacter, RMError>) -> Void)
}
