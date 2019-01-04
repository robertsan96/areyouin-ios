//
//  EventsViewController.swift
//  areyouin
//
//  Created by Robert Sandru on 1/4/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    var events: [Event] = [
        
        Event(name: "Wedding 👰🏻",
              backgroundImage: UIImage(named: "Wedding"),
              date: Date(dateString: "2022-07-09"),
              nameColor: UIColor.black,
              dateColor: UIColor.black),
        Event(name: "Hawaii Holiday ❤️",
              backgroundImage: UIImage(named: "Ocean"),
              date: Date(dateString: "2019-12-12"),
              nameColor: UIColor.white,
              dateColor: UIColor.white,
              personsInColor: UIColor.white),
        Event(name: "Retezat Teambuilding",
              backgroundImage: UIImage(named: "Clouds"),
              date: Date(dateString: "2019-04-02"),
              nameColor: UIColor.black,
              dateColor: UIColor.black),
        Event(name: "Depeche Mode Concert",
              backgroundImage: UIImage(named: "Concert"),
              date: Date(dateString: "2019-08-01"),
              nameColor: UIColor.white,
              dateColor: UIColor.white,
              personsInColor: UIColor.white),
    ]
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
    }
}

extension EventsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCollectionCell", for: indexPath) as! EventCollectionViewCell
        
        cell.feed(with: events[indexPath.row])
        
        return cell
    }
    
    
    
}
