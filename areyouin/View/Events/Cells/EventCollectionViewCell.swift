//
//  EventCollectionViewCell.swift
//  areyouin
//
//  Created by Robert Sandru on 1/4/19.
//  Copyright © 2019 Robert Sandru. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    var cornerRadius: CGFloat = 15
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var personsInLabel: UILabel!
    @IBOutlet weak var areInLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeLayer()
    }
    
    override func didMoveToWindow() {
        customizeBackgroundImage()
    }
    
    func customizeLayer() {
        layer.masksToBounds = false
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 10

        layer.cornerRadius = cornerRadius
    }
    
    func customizeBackgroundImage() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = cornerRadius
    }
}

extension EventCollectionViewCell {
    
    func feed(with event: Event) {
        update(background: event.backgroundImage)
        update(name: event.name, and: event.nameColor)
        update(date: event.date, and: event.dateColor)
        update(personsIn: event.personsIn, and: event.personsInColor)
    }
    
    func update(background to: UIImage?) {
        backgroundImageView.image = to
    }
    
    func update(name to: String?, and color: UIColor?) {
        nameLabel.text = to
        nameLabel.textColor = color
    }
    
    func update(date to: Date?, and color: UIColor?) {
        dateLabel.text = to?.eventCellFormat()
        dateLabel.textColor = color
    }
    
    func update(personsIn to: Int, and color: UIColor?) {
        personsInLabel.text = String(to)
        personsInLabel.textColor = color
        areInLabel.textColor = color
    }
}
