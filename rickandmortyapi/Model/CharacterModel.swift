// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterModel = try? newJSONDecoder().decode(CharacterModel.self, from: jsonData)

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    var info: Info
    var results: [CharacterResult]
}

// MARK: - Info
struct Info: Codable {
    var count, pages: Int
    var next: String
    var prev: JSONNull?
}

// MARK: - Result
struct CharacterResult: Codable, Hashable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

// MARK: - Location
struct Location: Codable, Hashable {
    var name: String
    var url: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
