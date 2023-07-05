//
//  ProfileTable.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 27.06.2023.
//

import Foundation

enum SettingsItemType {
    case arrow
    case option
}

struct SettingsItem {
    var type: SettingsItemType
    var title: String
    var subtitle: String?
}
