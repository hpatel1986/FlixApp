//
//  MovieCell.swift
//  FlixApp
//
//  Created by Hiren Patel on 2/2/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
//    var movie: Movie!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            
            let posterPathString = movie.posterPath;
            let baseURLString = "https://image.tmdb.org/t/p/w500/";
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterURL)
        }
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
