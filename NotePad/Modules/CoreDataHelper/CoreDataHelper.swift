//
//  CoreDataHelper.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//

import Foundation
import UIKit

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func fetchData() -> [NoteItems]? {
        do {
            return try self.context.fetch(NoteItems.fetchRequest())
        } catch {
            print("Fetch Data error: \(error.localizedDescription)")
        }
        return nil
    }
    
    
    
    func saveItem(title: String, description: String) {
        let newItem = NoteItems(context: context)
        
        newItem.title = title
        newItem.desc = description
        
        do {
            try self.context.save()
        } catch {
            print("Save Data error: \(error.localizedDescription)")
        }
        
    }
    
    func deleteItem(index: Int) {
        
        // get items at CoreData
        
        if let items = fetchData() {
            context.delete(items[index])
        }
        
        do {
            try self.context.save()
        } catch {
            print("Delete Item error: \(error.localizedDescription)")
        }
        
        
    }
    
    
}
