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
    @IBOutlet weak var areInLabel: UILabel!
    @IBOutlet weak var didNotReplyLabel: UILabel!
    @IBOutlet weak var didNotReplyTextLabel: UILabel!
    @IBOutlet weak var personOutLabel: UILabel!
    @IBOutlet weak var areOutLabel: UILabel!
    @IBOutlet weak var areOutTextLabel: UILabel!
    
    @IBOutlet weak var eventPersonsTableView: UITableView!
    
    var viewModel: EventDetailsVM?
    var disposeBag: DisposeBag = DisposeBag()
    var appearanceStyle: BehaviorSubject<AppearanceStyle> = BehaviorSubject(value: .light)
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventImageView.clipsToBounds = true
        eventPersonsTableView.delegate = self
        eventPersonsTableView.dataSource = self
        
        addGradientView()
        startSubscriptions()
    }
    
    func addGradientView() {
        eventImageGradientView.layer.sublayers = []
        let gradient = CAGradientLayer()
        let style: AppearanceStyle
        do {
            style = try appearanceStyle.value()
        } catch { return }
        let color = (style == .light) ? UIColor.white : UIColor.black
        gradient.frame = eventImageGradientView.bounds
        gradient.colors = [color.withAlphaComponent(0.1).cgColor,
                           color.cgColor]
        gradient.locations = [0.0, 1.0]
        eventImageGradientView.layer.insertSublayer(gradient, at: 0)
    }
}

extension EventDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        do {
            let event = try viewModel?.event.value()
            return event?.groups.count ?? 0
        } catch {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventPersonCell", for: indexPath) as! EventPersonTableViewCell
        do {
            let style = try appearanceStyle.value()
            cell.style.onNext(style)
            let event = try viewModel?.event.value()
            
            cell.feed(with: event!.groups[indexPath.section])
        } catch { return cell }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension EventDetailsViewController {
    
    func update(with event: Event) {
        eventNameLabel.text = event.name
        eventImageView.image = event.backgroundImage
        personsInLabel.text = String(event.personsIn)
        didNotReplyLabel.text = String(event.personsNoReply)
        personOutLabel.text = String(event.personsOut)
        appearanceStyle.onNext(event.appearance)
    }
    
    func update(appearance style: AppearanceStyle) {
        addGradientView()
        switch style {
        case .light:
            view.backgroundColor = UIColor.white
            
            eventNameLabel.textColor = UIColor.black
            areInLabel.textColor = UIColor.black
            didNotReplyTextLabel.textColor = UIColor.black
            areOutTextLabel.textColor = UIColor.black
        case .dark:
            view.backgroundColor = UIColor.black
            
            eventNameLabel.textColor = UIColor.white
            areInLabel.textColor = UIColor.white
            didNotReplyTextLabel.textColor = UIColor.white
            areOutTextLabel.textColor = UIColor.white
        }
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
        
        appearanceStyle
            .subscribe(onNext: { [weak self] appearanceStyle in
                self?.update(appearance: appearanceStyle)
            })
            .disposed(by: disposeBag)
    }
}
