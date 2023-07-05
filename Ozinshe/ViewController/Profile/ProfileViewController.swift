//
//  ProfileViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 27.06.2023.
//

import UIKit
import Localize_Swift

/*
 "PERSONALDATA" = "Личные данные";
 "CHANGEPASSWORD" = "Поменять пароль";
 "RULES" = "Правила";
 "NOTIFICATION" = "Уведомление";
 "DARKMODE" = "Темный режим";
 "CURRENTLANG" = "Русский";
 */

class ProfileViewController: UIViewController, LanguageProtocol {
    
    @IBOutlet weak var exitButton: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var gmailLabel: UILabel!
    @IBOutlet weak var myProfileLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    var settingsItems: [SettingsItem] = [
        SettingsItem(type: .arrow, title: "PERSONALDATA".localized(), subtitle: "Өңдеу"),
        SettingsItem(type: .arrow, title: "CHANGEPASSWORD".localized()),
        SettingsItem(type: .arrow, title: "LANGUAGE".localized(), subtitle: "CURRENTLANG".localized()),
        SettingsItem(type: .arrow, title: "RULES".localized(), subtitle: "Өңдеу"),
        SettingsItem(type: .option, title: "NOTIFICATION".localized()),
        SettingsItem(type: .option, title: "DARKMODE".localized()),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(Localize.currentLanguage())
        configureViews()
    }

    @IBAction func exitButtonTouched(_ sender: Any) {
        let exitVC = storyboard?.instantiateViewController(withIdentifier: "ExitViewController") as! ProfileLogoutViewController
        
        exitVC.modalPresentationStyle = .overFullScreen
        self.present(exitVC, animated: true)
    }
    
    func languageDidChange() {
        configureViews()
        settingsItems = [
        SettingsItem(type: .arrow, title: "PERSONALDATA".localized(), subtitle: "Өңдеу"),
        SettingsItem(type: .arrow, title: "CHANGEPASSWORD".localized()),
        SettingsItem(type: .arrow, title: "LANGUAGE".localized(), subtitle: "CURRENTLANG".localized()),
        SettingsItem(type: .arrow, title: "RULES".localized(), subtitle: "Өңдеу"),
        SettingsItem(type: .option, title: "NOTIFICATION".localized()),
        SettingsItem(type: .option, title: "DARKMODE".localized()),
    ]
    }
    
    func configureViews() {
        myProfileLabel.text = "MY_PROFILE".localized()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = settingsItems[indexPath.row]
        
        if currentItem.type == .arrow {
            let arrowCell = tableView.dequeueReusableCell(withIdentifier: "ArrowCell", for: indexPath) as! SettingsCellWithArrow
            arrowCell.setData(data: currentItem)
            
            return arrowCell
        }
        
        let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SettingsCellWithSwitch
        switchCell.setData(data: currentItem)
        
        return switchCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellNumber = indexPath.row + 1
        
        switch cellNumber {
        case 1:
            print("Data tapped")
        case 2:
            print("PassChange tapped")
        case 3:
            let languageVC = storyboard?.instantiateViewController(withIdentifier: "LanguageViewController") as! LanguageViewController
            languageVC.modalPresentationStyle = .overFullScreen
            present(languageVC, animated: true)
            languageVC.delegate = self
            print("Lang tapped")
        case 4:
            print("rules tapped")
        case 5:
            print("notifications switched")
        case 6:
            print("theme switched")
        default:
            print("")
        }
    }
}
