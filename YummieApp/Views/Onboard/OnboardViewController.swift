//
//  OnboardViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 8.05.2023.
//

import UIKit

class OnboardViewController: UIViewController  {
    
    

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var onboardList : [OnboardModel] = []
    
    var currentPage : Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardList.count - 1 {
                nextButton.setTitle("Get Started",for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        onboardList = [
            OnboardModel(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardModel(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardModel(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        
        pageControl.numberOfPages = onboardList.count
    }
    
    @IBAction func next(_ sender: Any) {
        if currentPage == onboardList.count-1 {
            let conroller = storyboard?.instantiateViewController(withIdentifier: "HomeNc") as! UINavigationController
            conroller.modalPresentationStyle = .fullScreen
            conroller.modalTransitionStyle = .flipHorizontal
            self.present(conroller, animated: true)
        }
        else{
            currentPage += 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    

}

extension OnboardViewController : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.identifier, for: indexPath) as! OnboardCollectionViewCell
        
        cell.setup(onboard: onboardList[indexPath.row])
        
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
