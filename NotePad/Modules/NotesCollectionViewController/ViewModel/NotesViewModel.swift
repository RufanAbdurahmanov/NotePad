//
//  NotesViewModel.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import Foundation

class NotesViewModel {
    
    var items: [NoteItems] = []
    
    // Fetch Data from Core Data
    
    func fetchNotes() {
        items = CoreDataHelper.shared.fetchData()?.reversed() ?? [NoteItems]()
    }
    
    func saveNote(title: String, description: String) {
        CoreDataHelper.shared.saveItem(title: title, description: description)
    }
    
    func deleteNote(index: Int) {
        CoreDataHelper.shared.deleteItem(index: index)
    }
    
}
