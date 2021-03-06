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
              dateColor: UIColor.black,
              
              groups: Group.DUMMY(number: 10)
        ),
        Event(name: "Hawaii Holiday ❤️",
              backgroundImage: UIImage(named: "Ocean"),
              date: Date(dateString: "2019-12-12"),
              nameColor: UIColor.white,
              dateColor: UIColor.white,
              personsInColor: UIColor.white,
              
              groups: Group.DUMMY(number: 4)),
        Event(name: "Retezat Teambuilding",
              backgroundImage: UIImage(named: "Clouds"),
              date: Date(dateString: "2019-04-02"),
              nameColor: UIColor.black,
              dateColor: UIColor.black,
              
              groups: Group.DUMMY(number: 7)),
        Event(name: "Depeche Mode Concert",
              backgroundImage: UIImage(named: "Concert"),
              date: Date(dateString: "2019-08-01"),
              nameColor: UIColor.white,
              dateColor: UIColor.white,
              personsInColor: UIColor.white,
              appearanceStyle: .dark,
              
              groups: Group.DUMMY(number: 2))
    ]
    
    var selectedEvent: Event?
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toEventDetails.identifier() {
            guard let selectedEvent = selectedEvent else { return }
            let eventDetailsVC = (segue.destination as? EventDetailsViewController)
            let eventDetailsVM = EventDetailsVM(with: selectedEvent)
            eventDetailsVC?.viewModel = eventDetailsVM
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedEvent = events[indexPath.row]
        performSegue(withIdentifier: Segues.toEventDetails.identifier(), sender: self)
    }
    
}
