//
//  SettingsCellWithArrow.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 27.06.2023.
//

import UIKit

class SettingsCellWithArrow: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(data: SettingsItem) {
        titleLabel.text = data.title
        descriptionLabel.text = data.subtitle
        
        self.selectionStyle = .none
    }
}
