//
//  FavoriteTableViewCell.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 08.07.2023.
//

import UIKit
import SDWebImage

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //  code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(movie: Movie){
        nameLabel.text = movie.name
        yearLabel.text = String(movie.year)
        genreLabel.text = movie.genres
        categoriesLabel.text = movie.categories
        posterImage.sd_setImage(with: URL(string: movie.poster_link), completed: nil)
    }
}
