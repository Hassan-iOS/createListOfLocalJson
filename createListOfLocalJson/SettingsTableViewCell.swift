//
//  SettingsTableViewCell.swift
//  createListOfLocalJson
//
//  Created by Hassan Mostafa on 03/03/2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var settingsIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var settings: SettingsModel! {
        didSet {
            settingsTitle.text = settings.title
            settingsIcon.image = UIImage(named: settings.image)
        }
    }
}
