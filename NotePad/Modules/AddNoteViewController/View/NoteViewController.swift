//
//  AddNoteViewController.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    let viewModel = NotesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  
    

    @IBAction func saveButton(_ sender: Any) {

        if titleTextField.text != "" && titleTextField.text != nil {
            CoreDataHelper.shared.saveItem(title: titleTextField.text!, description: DescriptionTextView.text)
        }
        
    }
    
}
