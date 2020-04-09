//
//  TableViewCell.swift
//  MovieDemo
//
//  Created by Ahmad Eisa on 4/5/20.
//  Copyright © 2020 Ahmad Eisa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var list = [Movie](){
        didSet{
            print(list)
            collectionView.reloadData()
        }willSet{
            
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var moviesCategoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func showAllMoviesBtnPressed(_ sender: Any) {
    }
    
    @IBAction func collapseMovieCellBtnPressed(_ sender: Any) {
    }
    
}
