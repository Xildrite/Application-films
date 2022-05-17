//
//  Genre.swift
//  Projet2
//
//  Created by Baptiste Taviot on 19/04/2022.
//

import Foundation

struct Genre: Decodable {
    var id: Int
    var name: String
}

struct GenreResponse: Decodable {
    var genres: [Genre]
}
