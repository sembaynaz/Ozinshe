//
//  OnboardingViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 09.06.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
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
        
        configurePageControl()
    }
    
    private func configurePageControl() {
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1/1.1, y: 1/1.1)
        }
        for i in 0..<slidesArray.count {
            pageControl.setIndicatorImage(UIImage(named: "Indicator"), forPage: i)
            pageControl.setCurrentPageIndicatorImage(UIImage(named: "ActiveIndicator"), forPage: i)
        }
    }
    
    @IBAction func skipButtonTouched(_ sender: Any) {
        let signinVC = storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
        
        navigationController?.show(signinVC, sender: self)
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        let signinVC = storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
        
        navigationController?.show(signinVC, sender: self)
    }
    
    @IBAction func pageControlTouched(_ sender: UIPageControl) {
        print(pageControl.numberOfPages)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell

        let index = indexPath.row
        
        cell.setup(slidesArray[index])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
