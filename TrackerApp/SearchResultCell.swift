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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Changing the row selection color
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
