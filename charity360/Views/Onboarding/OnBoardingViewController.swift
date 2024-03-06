//
//  OnBoardingViewController.swift
//  charity360
//
//  Created by admin on 05/03/24.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides : [OnboardingSlide] = [] 
    
    var currentPage = 0{
            didSet{
                pageControl.currentPage = currentPage
                if currentPage == slides.count - 1 {
                    nextButton.setTitle("Get Started", for: .normal)
                }else {
                    nextButton.setTitle("Next", for: .normal)
                }
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
                        OnboardingSlide(title: "Create Your Own Charity Events!", description: " Add your own Date, time and Summary of the Charity Event", image: UIImage(named: "ONBOARDING1")!),
                        OnboardingSlide(title: "Publish Your Charity Blog!", description: "Take all the philanthropists on an amazing journey with your own Blog of the Charity Event ", image: UIImage(named: "ONBOARDING2")!),
                        OnboardingSlide(title: "Provide Donations to Campaigns!", description: "Donation Campaigns to faciltate your financial stability ", image: UIImage(named: "ONBOARDING3")!)
                        // Add more slides as needed
                    ]
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {if currentPage == slides.count - 1 {
        let tabBarController = storyboard?.instantiateViewController(identifier: "MainTabBarController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = tabBarController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    } else {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

}
extension  OnBoardingViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
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
