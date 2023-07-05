//
//  PlofileLogoutViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 29.06.2023.
//

import UIKit


class LogoutViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var viewTranslation = CGPoint(x: 0, y: 0)

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))

    }
    @IBAction func logoutButtonTouched(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        
        let rootVC = storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @IBAction func notLogoutButtonTouched(_ sender: Any) {
        dismissView()
    }
    
    func configureView() {
        backgroundView.layer.cornerRadius = 32
        backgroundView.clipsToBounds = true
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
            
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.backgroundView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.backgroundView.transform = .identity
                })
            }
            else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if (touch.view?.isDescendant(of: backgroundView))! {
            return false
        }
        return true
    }
}
