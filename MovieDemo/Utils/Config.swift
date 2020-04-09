//
//  Constants.swift
//  MovieDemo
//
//  Created by Ahmad Eisa on 4/7/20.
//  Copyright © 2020 Ahmad Eisa. All rights reserved.
//

import Foundation
struct URLs {
    
    static let base = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "de8813a3740caaec3a52a89c86cd126f"
    static let popularMoviesURL = "\(base)" + "popular?api_key=" + "\(apiKey)"
    static let topRatedURL = "\(base)" +  "top_rated?api_key=" + "\(apiKey) "
    static let comingSoonURL = "\(base)" +  "upcoming?api_key=" + "\(apiKey) "
    static let nowPlayingURL = "\(base)" +  "now_playing?api_key=" + "\(apiKey) "
    
}

struct Identifiers {
   static let TableViewCell = "TableViewCell"
      static let CollectionViewCell = "CollectionViewCell"
}
