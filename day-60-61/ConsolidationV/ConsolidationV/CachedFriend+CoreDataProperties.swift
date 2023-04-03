//
//  CachedFriend+CoreDataProperties.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 10/03/23.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }

}

extension CachedFriend : Identifiable {

}
