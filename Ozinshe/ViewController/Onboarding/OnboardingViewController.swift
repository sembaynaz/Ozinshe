//
//  OnboardingViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 09.06.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage != slidesArray.count - 1 {
                skipButton.isHidden = false
                nextButton.isHidden = true
            } else {
                nextButton.isHidden = false
                skipButton.isHidden = true
            }
        }
    }
    var slidesArray: [Slide] = [
        Slide(description: "Фильмдер, телехикаялар, ситкомдар, \nанимациялық жобалар, телебағдарламалар \nмен реалити-шоулар, аниме және тағы \nбасқалары", slideImage: "slide1"),
        Slide(description: "Кез келген құрылғыдан қара \nСүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара", slideImage: "slide2"),
        Slide(description: "Тіркелу оңай. Қазір тіркел де қалаған \nфильміңе қол жеткіз", slideImage: "slide3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        
        nextButton.layer.cornerRadius = 8
        skipButton.layer.cornerRadius = 8
    }
    
    @IBAction func skipButtonTouched(_ sender: Any) {
        
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        
    }
    
    @IBAction func pagecontroller(_ sender: Any) {

    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell

        cell.setup(slidesArray[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage = currentPage
    }
}
