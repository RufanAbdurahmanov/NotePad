//
//  NotesTableViewController.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import UIKit

class NotesCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = NotesViewModel()
    
    let cellID = "\(NotesCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notes"
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNotes()
    }
    
    func updateNotes() {
        viewModel.fetchNotes()
        collectionView.reloadData()
    }

    @IBAction func addButton(_ sender: Any) {
        
        let AddNoteViewController = storyboard?.instantiateViewController(withIdentifier: "\(AddNoteViewController.self)")
        navigationController?.show(AddNoteViewController!, sender: nil)
    }
    
}

extension NotesCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NotesCollectionViewCell
        cell.configure(note: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showNotesViewController = storyboard?.instantiateViewController(withIdentifier: "\(ShowNoteViewController.self)") as! ShowNoteViewController
        ShowNoteViewController.viewModel = ShowNoteViewModel(title: viewModel.items[indexPath.item].title ?? "", description: viewModel.items[indexPath.item].desc ?? "")
        navigationController?.show(showNotesViewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width * 0.92, height: 72)
        }
    
    
}
    

