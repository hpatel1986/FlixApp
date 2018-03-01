//
//  Movie.swift
//  FlixApp
//
//  Created by Hiren Patel on 2/26/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import Foundation


class Movie {
    var title: String
    var overview: String
    var releaseDate: String
    var posterUrl: URL?
    var posterPath: String
    var baseURL: String
    var backdropPath: String
    var backdropURL: URL
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        baseURL = "https://image.tmdb.org/t/p/w500"
        backdropPath = dictionary["backdrop_path"] as? String ?? "No backdrop path"
        posterPath = dictionary["poster_path"] as? String ?? "No poster path"
        posterUrl = URL(string: baseURL + posterPath)!
        backdropURL = URL(string: baseURL + backdropPath)!

        
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
