//
//  ShowNoteViewController.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import UIKit

class ShowNoteViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descTExtView: UITextView!
    
    static var viewModel = ShowNoteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = ShowNoteViewController.viewModel.title
        self.descTExtView.text = ShowNoteViewController.viewModel.description

        // Do any additional setup after loading the view.
    }

}
