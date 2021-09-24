//
//  rickandmortyapiTests.swift
//  rickandmortyapiTests
//
//  Created by wahyujus on 04/09/21.
//

import XCTest
@testable import rickandmortyapi

class rickandmortyapiTests: XCTestCase {
    
    let networkManager = NetworkManager.shared
    
    func testCanParseCharacter()throws{
        let json = """
        {
            "info": {
                "count": 671,
                "pages": 34,
                "next": "https://rickandmortyapi.com/api/character?page=2",
                "prev": null
            },
            "results": [
                {
                    "id": 1,
                    "name": "Rick Sanchez",
                    "status": "Alive",
                    "species": "Human",
                    "type": "",
                    "gender": "Male",
                    "origin": {
                        "name": "Earth (C-137)",
                        "url": "https://rickandmortyapi.com/api/location/1"
                    },
                    "location": {
                        "name": "Earth (Replacement Dimension)",
                        "url": "https://rickandmortyapi.com/api/location/20"
                    },
                    "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    "episode": [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3",
                        "https://rickandmortyapi.com/api/episode/4",
                        "https://rickandmortyapi.com/api/episode/5",
                        "https://rickandmortyapi.com/api/episode/6",
                        "https://rickandmortyapi.com/api/episode/7",
                        "https://rickandmortyapi.com/api/episode/8",
                        "https://rickandmortyapi.com/api/episode/9",
                        "https://rickandmortyapi.com/api/episode/10",
                        "https://rickandmortyapi.com/api/episode/11",
                        "https://rickandmortyapi.com/api/episode/12",
                        "https://rickandmortyapi.com/api/episode/13",
                        "https://rickandmortyapi.com/api/episode/14",
                        "https://rickandmortyapi.com/api/episode/15",
                        "https://rickandmortyapi.com/api/episode/16",
                        "https://rickandmortyapi.com/api/episode/17",
                        "https://rickandmortyapi.com/api/episode/18",
                        "https://rickandmortyapi.com/api/episode/19",
                        "https://rickandmortyapi.com/api/episode/20",
                        "https://rickandmortyapi.com/api/episode/21",
                        "https://rickandmortyapi.com/api/episode/22",
                        "https://rickandmortyapi.com/api/episode/23",
                        "https://rickandmortyapi.com/api/episode/24",
                        "https://rickandmortyapi.com/api/episode/25",
                        "https://rickandmortyapi.com/api/episode/26",
                        "https://rickandmortyapi.com/api/episode/27",
                        "https://rickandmortyapi.com/api/episode/28",
                        "https://rickandmortyapi.com/api/episode/29",
                        "https://rickandmortyapi.com/api/episode/30",
                        "https://rickandmortyapi.com/api/episode/31",
                        "https://rickandmortyapi.com/api/episode/32",
                        "https://rickandmortyapi.com/api/episode/33",
                        "https://rickandmortyapi.com/api/episode/34",
                        "https://rickandmortyapi.com/api/episode/35",
                        "https://rickandmortyapi.com/api/episode/36",
                        "https://rickandmortyapi.com/api/episode/37",
                        "https://rickandmortyapi.com/api/episode/38",
                        "https://rickandmortyapi.com/api/episode/39",
                        "https://rickandmortyapi.com/api/episode/40",
                        "https://rickandmortyapi.com/api/episode/41"
                    ],
                    "url": "https://rickandmortyapi.com/api/character/1",
                    "created": "2017-11-04T18:48:46.250Z"
                },
            ]
        }
        """
        let jsonData = json.data(using: .utf8)!
        let characterData = try! JSONDecoder().decode(CharacterModel.self, from: jsonData)
        
        
        //mocking first data from array
        XCTAssertEqual(1, characterData.results.first?.id)
        XCTAssertEqual(
            "Rick Sanchez", characterData.results.first?.name)
        XCTAssertEqual(34, characterData.info.pages)
    }
    
    func testCharacterIsEmpty()throws{
        let json = """
        {
            "info": {
                "count": 671,
                "pages": 34,
                "next": "https://rickandmortyapi.com/api/character?page=2",
                "prev": null
            },
            "results": [
                {
                    "id": 1,
                    "name": "",
                    "status": "",
                    "species": "Human",
                    "type": "",
                    "gender": "Male",
                    "origin": {
                        "name": "Earth (C-137)",
                        "url": "https://rickandmortyapi.com/api/location/1"
                    },
                    "location": {
                        "name": "Earth (Replacement Dimension)",
                        "url": "https://rickandmortyapi.com/api/location/20"
                    },
                    "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    "episode": [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3",
                        "https://rickandmortyapi.com/api/episode/4",
                        "https://rickandmortyapi.com/api/episode/5",
                        "https://rickandmortyapi.com/api/episode/6",
                        "https://rickandmortyapi.com/api/episode/7",
                        "https://rickandmortyapi.com/api/episode/8",
                        "https://rickandmortyapi.com/api/episode/9",
                        "https://rickandmortyapi.com/api/episode/10",
                        "https://rickandmortyapi.com/api/episode/11",
                        "https://rickandmortyapi.com/api/episode/12",
                        "https://rickandmortyapi.com/api/episode/13",
                        "https://rickandmortyapi.com/api/episode/14",
                        "https://rickandmortyapi.com/api/episode/15",
                        "https://rickandmortyapi.com/api/episode/16",
                        "https://rickandmortyapi.com/api/episode/17",
                        "https://rickandmortyapi.com/api/episode/18",
                        "https://rickandmortyapi.com/api/episode/19",
                        "https://rickandmortyapi.com/api/episode/20",
                        "https://rickandmortyapi.com/api/episode/21",
                        "https://rickandmortyapi.com/api/episode/22",
                        "https://rickandmortyapi.com/api/episode/23",
                        "https://rickandmortyapi.com/api/episode/24",
                        "https://rickandmortyapi.com/api/episode/25",
                        "https://rickandmortyapi.com/api/episode/26",
                        "https://rickandmortyapi.com/api/episode/27",
                        "https://rickandmortyapi.com/api/episode/28",
                        "https://rickandmortyapi.com/api/episode/29",
                        "https://rickandmortyapi.com/api/episode/30",
                        "https://rickandmortyapi.com/api/episode/31",
                        "https://rickandmortyapi.com/api/episode/32",
                        "https://rickandmortyapi.com/api/episode/33",
                        "https://rickandmortyapi.com/api/episode/34",
                        "https://rickandmortyapi.com/api/episode/35",
                        "https://rickandmortyapi.com/api/episode/36",
                        "https://rickandmortyapi.com/api/episode/37",
                        "https://rickandmortyapi.com/api/episode/38",
                        "https://rickandmortyapi.com/api/episode/39",
                        "https://rickandmortyapi.com/api/episode/40",
                        "https://rickandmortyapi.com/api/episode/41"
                    ],
                    "url": "https://rickandmortyapi.com/api/character/1",
                    "created": "2017-11-04T18:48:46.250Z"
                },
            ]
        }
        """
        let jsonData = json.data(using: .utf8)!
        let characterData = try! JSONDecoder().decode(CharacterModel.self, from: jsonData)
        
        
        //mocking empty data on first from array
        XCTAssertEqual("", characterData.results.first?.name)
        XCTAssertEqual("", characterData.results.first?.status)
    }
    
    func testCanParseCharacterViaJsonFile()throws{
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "get_characters_response", ofType: "json") else { fatalError("json not found") }
        
        print("jsonPath => \(pathString)\n\n")
        
        guard let json = try? String(contentsOfFile: pathString,encoding: .utf8)else{ fatalError("unable to convert json to string")}
        
        let jsonData = json.data(using: .utf8)!
        let characterData = try! JSONDecoder().decode(CharacterModel.self, from: jsonData)
        
        //mocking last data from array
        XCTAssertEqual(20, characterData.results.last?.id)
        XCTAssertEqual("Ants in my Eyes Johnson", characterData.results.last?.name)
        XCTAssertEqual("unknown", characterData.results.last?.status)
        XCTAssertEqual("Human", characterData.results.last?.species)
        XCTAssertEqual("Human with ants in his eyes", characterData.results.last?.type)
        XCTAssertEqual("Male", characterData.results.last?.gender)
        XCTAssertEqual("https://rickandmortyapi.com/api/character/avatar/20.jpeg", characterData.results.last?.image)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
