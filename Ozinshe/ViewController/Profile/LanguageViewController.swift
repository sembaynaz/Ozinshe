//
//  LanguageViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 29.06.2023.
//

import UIKit
import Localize_Swift
protocol LanguageProtocol {
    func languageDidChange()
}

class LanguageViewController: UIViewController, UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var viewBackgground: UIView!
    @IBOutlet weak var tableview: UITableView!
    
    var delegate: LanguageProtocol?
    var viewTranslation = CGPoint(x: 0, y: 0)
    var languageArray = [["English", "en"], ["Қазақша", "kk"], ["Русский", "ru"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if (touch.view?.isDescendant(of: viewBackgground))! {
            return false
        }
        return true
    }
    
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.viewBackgground.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.viewBackgground.transform = .identity
                })
            }
            else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = languageArray[indexPath.row][0]
        
        let checkImageView = cell.viewWithTag(1001) as! UIImageView
        if Localize.currentLanguage() == languageArray[indexPath.row][1] {
            checkImageView.image = UIImage(named: "Check")
        } else {
            checkImageView.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languageArray[indexPath.row][1])
        delegate?.languageDidChange()
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
