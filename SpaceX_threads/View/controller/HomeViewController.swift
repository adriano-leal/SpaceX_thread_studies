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
    
    @IBOutlet weak var noImageInDataBase: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.setRoundCorners(ammount: 15)
        self.previousButton.setAppearance()
        self.nextButton.setAppearance()
    }
}
