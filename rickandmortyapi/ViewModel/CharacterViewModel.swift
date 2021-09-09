//
//  CharacterViewModel.swift
//  rickandmortyapi
//
//  Created by wahyujus on 09/09/21.
//

import Foundation

class CharacterViewModel {
    
    private var apiService = Parser()
    public var characters = [Result]()
    
    func fetchCharactersData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getrickandmortyAPI { [weak self] (result) in
            
            self?.characters = result
            completion()
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if characters.count != 0 {
            return characters.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Result {
        return characters[indexPath.row]
    }
}
