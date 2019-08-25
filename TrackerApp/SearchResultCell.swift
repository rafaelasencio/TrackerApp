//
//  SearchResultCell.swift
//  TrackerApp
//
//  Created by Rafael on 22/08/2019.
//  Copyright © 2019 RafaelAB. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    //MARK:- IBOulets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
    //MARK:- Variables
    var downloadTask: URLSessionDownloadTask?
    
    // MARK:- Public Methods
    func configure(for result: SearchResult) {
        nameLabel.text = result.name
        if result.artist.isEmpty {
            artistNameLabel.text = "Unknown"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)", result.artist, result.type)
        }
        artworkImageView.image = UIImage(named: "Placeholder")
        if let smallURL = URL(string: result.imageSmall) {
            downloadTask = artworkImageView.loadImage(url: smallURL)
        }
    }
    //Cancel any image download that is still in progress. don’t download more data than you need
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
        print("_Image Cancelled_")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Change the row selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255,
                                               green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
