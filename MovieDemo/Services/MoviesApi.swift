//
//  MoviesApi.swift
//  MovieDemo
//
//  Created by Ahmad Eisa on 4/8/20.
//  Copyright © 2020 Ahmad Eisa. All rights reserved.
//

import UIKit
import Alamofire

class MoviesApi {
    
    // Web Request with Alamofire & parse data with Codable
    func getMovie(url: String ,completion: @escaping ([Movie]?)->(Void)) {
        
        guard let url = URL(string: url) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do{
                print(response)
                let movie = try jsonDecoder.decode(MovieList.self, from: data)
                
                completion(movie.results)
                
            }catch{
                debugPrint(error)
                completion(nil)
            }
            
            
            
        }
        
        
    }
    
    
    
    
}


