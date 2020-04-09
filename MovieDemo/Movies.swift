//
//  ViewController.swift
//  MovieDemo
//
//  Created by Ahmad Eisa on 4/5/20.
//  Copyright © 2020 Ahmad Eisa. All rights reserved.
//

import UIKit

class Movies: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var topMovies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    var popularMovies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    var comingSoonMovies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    var nowPlayingMovies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        CallPopularMoviesApi(url: URLs.topRatedURL)
        CallPopularMoviesApi(url: URLs.popularMoviesURL)
        CallPopularMoviesApi(url: URLs.comingSoonURL)
        CallPopularMoviesApi(url: URLs.nowPlayingURL)
        let nib = UINib(nibName: Identifiers.TableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifiers.TableViewCell)
        
    }
    
    func CallPopularMoviesApi(url: String)  {
        
        MoviesApi().getMovie(url: url) { (movie) -> (Void) in
            
            guard let movie = movie else { return }
            print(movie)
            if url == "topmovies"{
                self.topMovies = movie
            }else if url == "popularMovies"{
                self.popularMovies = movie
            }else if url == "comingsoon" {
                self.comingSoonMovies = movie
            }else if url == "nowplaying" {
                self.nowPlayingMovies = movie
            }
        }
    }


}


extension Movies: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 4
        
        if topMovies.count == 0 {
            count = count - 1
        }else if popularMovies.count == 0 {
                count = count - 1
        }else if comingSoonMovies.count == 0 {
            count = count - 1
        }else if nowPlayingMovies.count == 0 {
            count = count - 1
        }
        print(count)
       return count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableViewCell, for: indexPath) as? TableViewCell{
            switch indexPath.row{
            case 0:
                if topMovies.count > 0{
                    print(topMovies)
                    cell.list = topMovies
                }else if popularMovies.count > 0{
                    cell.list = popularMovies
                }else if comingSoonMovies.count > 0{
                    cell.list = comingSoonMovies
                }else if nowPlayingMovies.count > 0{
                    cell.list = nowPlayingMovies
                }
            default:
                print ("error")
            }
        }
        return UITableViewCell()
    }
    
    
}
    
    

