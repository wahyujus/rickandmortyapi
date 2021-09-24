//
//  RMError.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import Foundation

enum RMError: String, Error {
    case invalidUsername    = "this username create an invalid request. please try again"
    case unableToComplete   = "unable to complete your request. please check your internet connection"
    case invalidResponse    = "invalid response from the server. please try again."
    case invalidData        = "the data received from the server is invalid, please try again"
}
