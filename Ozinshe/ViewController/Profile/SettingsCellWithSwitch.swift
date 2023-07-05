//
//  SettingsCellWithSwitch.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 29.06.2023.
//

import UIKit
import Localize_Swift

class SettingsCellWithSwitch: UITableViewCell {

    @IBOutlet weak var titleSettingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: SettingsItem) {
        titleSettingLabel.text = data.title
        
        self.selectionStyle = .none
    }

}
