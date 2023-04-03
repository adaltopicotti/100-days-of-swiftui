//
//  CachedUser+CoreDataProperties.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 10/03/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var tags: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friend: NSSet?
    
    public var friendArray: [CachedFriend] {
        let set = friend as? Set<CachedFriend> ?? []
//        print(set)
        return []
//        return set.sorted {
//            $0.wrappedName < $1.wrappedName
//        }
    }

}

extension CachedUser {

    @objc(addCachedFriendObject:)
    @NSManaged public func addToCachedFriend(_ value: CachedFriend)

    @objc(removeCachedFriendObject:)
    @NSManaged public func removeFromCachedFriend(_ value: CachedFriend)

    @objc(addCachedFriend:)
    @NSManaged public func addToCachedFriend(_ values: NSSet)

    @objc(removeCachedFriend:)
    @NSManaged public func removeFromCachedFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
