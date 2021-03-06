//
//  Movie.swift
//  Projet2
//
//  Created by Baptiste Taviot on 19/04/2022.
//


//Structure pour les films

import Foundation

struct Movie: Decodable {
    var adult: Bool;
    var backdrop_path: String;
    var genre_ids : [Int];
    var id: Int;
    var original_language: String;
    var original_title: String;
    var overview: String;
    var popularity: Float;
    var poster_path: String;
    var release_date: String;
    var title: String;
    var video: Bool;
    var vote_average: Float;
    var vote_count: Int;
}

struct MovieResponse: Decodable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}
