//
//  NoteItems+CoreDataProperties.swift
//  NotePad
//
//  Created by Rufan Abdurahmanov on 10.10.22.
//
//

import Foundation
import CoreData


extension NoteItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItems> {
        return NSFetchRequest<NoteItems>(entityName: "NoteItems")
    }

    @NSManaged public var desc: String?
    @NSManaged public var title: String?

}

extension NoteItems : Identifiable {

}
