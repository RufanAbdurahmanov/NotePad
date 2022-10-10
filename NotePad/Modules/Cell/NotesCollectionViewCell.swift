//
//  NotesCollectionViewCell.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import UIKit


class NotesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .link
        layer.cornerRadius  = 6
    }
    
    func configure(note: NoteItems) {
        titleLabel.text = note.title
        descriptionLabel.text = note.desc
    }

}
