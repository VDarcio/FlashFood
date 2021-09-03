//
//  OnBoardingViewController.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    // IB Outlets
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides : [OnBoardingSlide] = []
    
    //settin the page control property to the current page number via computed properties
    var currentPage = 0 {
        didSet{
            
            pageControl.currentPage = currentPage
            //change the button if the user is in the last page
            if currentPage == slides.count - 1{
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
                    OnBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnBoardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
                
    }
    

  
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //Navigate to the home page if the user taps nexte after the last page
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(identifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }else{
            //if not, go to the next page
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectioView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
}


extension OnBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        //send the properties to the cell class
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //set the sell size to fill the whole collection view
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       //detect if the user has finished scrolling to update page control indicator
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        
        
    }
    
    
}
