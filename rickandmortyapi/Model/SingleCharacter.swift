//
//  SingleCharacter.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

struct SingleCharacter: Codable {
    var id: Int
    var name, status, species, type: String
    var gender: String
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}
