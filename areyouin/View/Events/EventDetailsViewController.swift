//
//  EventDetailsViewController.swift
//  areyouin
//
//  Created by Robert Sandru on 1/5/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import UIKit
import RxSwift

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventImageGradientView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var personsInLabel: UILabel!
    @IBOutlet weak var didNotReplyLabel: UILabel!
    @IBOutlet weak var personOutLabel: UILabel!
    
    var viewModel: EventDetailsVM?
    var disposeBag: DisposeBag = DisposeBag()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventImageView.clipsToBounds = true
        
        addGradientView()
        startSubscriptions()
    }
    
    func addGradientView() {
        let mask = CAGradientLayer()
        mask.startPoint = CGPoint(x: 0.5, y: 0.0)
        mask.endPoint = CGPoint(x:0.5, y:1.0)
        let whiteColor = UIColor.white
        mask.colors = [whiteColor.withAlphaComponent(1).cgColor,
                       whiteColor.withAlphaComponent(1.0),
                       whiteColor.withAlphaComponent(1.0).cgColor]
        mask.locations = [NSNumber(value: 0.0),
                          NSNumber(value: 0.2),
                          NSNumber(value: 1.0)]
        mask.frame = eventImageGradientView.bounds
        eventImageGradientView.layer.mask = mask
    }
}

extension EventDetailsViewController {
    
    func update(with event: Event) {
        eventNameLabel.text = event.name
        eventImageView.image = event.backgroundImage
        personsInLabel.text = String(event.personsIn)
        didNotReplyLabel.text = String(event.personsNoReply)
        personOutLabel.text = String(event.personsOut)
    }
}

extension EventDetailsViewController {
    
    func startSubscriptions() {
        viewModel?
            .event
            .subscribe(onNext: { [weak self] event in
                self?.update(with: event)
            })
            .disposed(by: disposeBag)
    }
}
