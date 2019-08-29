//
//  HomeViewController.swift
//  SpaceX_threads
//
//  Created by Adriano Ramos on 27/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var rocketLaunchDate: UILabel!
    @IBOutlet weak var rocketDescription: UILabel!
    
    @IBOutlet weak var noImageInDBImage: UIImageView!
    @IBOutlet weak var noImageInDBLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsAppearance()
        setCollectionViewAppearance()
        setPageControllConfigurations()
        setCollectionViewDelegates()
    }
    
    func setButtonsAppearance () {
        self.previousButton.setAppearance()
        self.nextButton.setAppearance()
    }
    
    func setCollectionViewAppearance () {
        self.collectionView.setRoundCorners(ammount: 7)
        self.noImageInDBImage.layer.cornerRadius = 7
        self.noImageInDBLabel.center = self.noImageInDBImage.center
    }
    
    func setPageControllConfigurations () {
        self.pageControl.numberOfPages = collectionView.numberOfSections
        self.pageControl.currentPage = 0
    }
    
    func setCollectionViewDelegates () {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func imageOnDataBase (exists: Bool) {
        if exists {
            self.noImageInDBImage.isHidden = true
            self.noImageInDBLabel.isHidden = true
            // perform adicional actions
        } else {
            self.noImageInDBImage.isHidden = false
            self.noImageInDBLabel.isHidden = false
            // perform adicional actions
        }
    }
    
    func descriptionOnDataBase (exists: Bool, descriptionText: String?) {
        if exists && descriptionText != nil {
            self.rocketDescription.text = description
            // perform adicional actions
        } else {
            self.rocketDescription.text = "No description provided for this rocket."
            // perform adicional actions
        }
    }
    
    func receiveImages (image data: [Data]) {
        // perform actions
        print(data)
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "rocketImageCell", for: indexPath) as? RocketImagesCollectionViewCell else { fatalError() }
        DispatchQueue.main.async {
            cell.rocketImage.image = UIImage(named: "")
        }
        return cell
    }

}
