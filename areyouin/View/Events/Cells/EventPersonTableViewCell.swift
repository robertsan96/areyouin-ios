//
//  EventPersonTableViewCell.swift
//  areyouin
//
//  Created by Robert Sandru on 1/5/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import UIKit
import RxSwift

class EventPersonTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
    private var type: BehaviorSubject<GroupType> = BehaviorSubject(value: .single)
    var style: BehaviorSubject<AppearanceStyle> = BehaviorSubject(value: .light)
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        customizeCell()
    }

    func customizeCell() {
    
        layer.cornerRadius = 5
        layer.masksToBounds = false
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 1
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        selectedBackgroundView.layer.cornerRadius = 5
        self.selectedBackgroundView = selectedBackgroundView
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        startSubscriptions()
    }
}

extension EventPersonTableViewCell {
    
    func feed(with group: Group) {
        type.onNext(group.type)
        
        switch group.type {
        case .single:
            guard let person = group.persons.first else { return }
            let firstName = person.firstName ?? ""
            let lastName = person.lastName ?? ""
            let name = firstName + " " + lastName
            groupNameLabel.text = name
        case .group:
            groupNameLabel.text = group.name
        }
    }
    
    func update(type to: GroupType) {
        switch to {
        case .single:
            let image = UIImage(named: "Person")?.withRenderingMode(.alwaysTemplate)
            groupImageView.image = image
            
        case .group:
            let image = UIImage(named: "Group")?.withRenderingMode(.alwaysTemplate)
            groupImageView.image = image
        }
    }
    
    func update(style to: AppearanceStyle) {
        switch to {
        case .light:
            backgroundColor = UIColor.white
            groupImageView.tintColor = UIColor.black.withAlphaComponent(0.5)
            groupNameLabel.textColor = UIColor.black
        case .dark:
            backgroundColor = UIColor(red: 28/255, green: 26/255, blue: 26/255, alpha: 1)
            groupImageView.tintColor = UIColor.white.withAlphaComponent(0.8)
            groupNameLabel.textColor = UIColor.white
        }
    }
    
    func startSubscriptions() {
        type
            .subscribe(onNext: { [weak self] type in
                self?.update(type: type)
            })
            .disposed(by: disposeBag)
        
        style
            .subscribe(onNext: { [weak self] style in
                self?.update(style: style)
            })
            .disposed(by: disposeBag)
    }
}
