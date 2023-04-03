//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Adalto Picotti Junior on 07/03/23.
//

import CoreData
import SwiftUI

enum Predicate {
    case  beginsWith, contains
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
//    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
//        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
//
//        self.content = content
//    }
    
    init(filterKey: String, filterValue: String, predicate: Predicate, sortDescriptors: [SortDescriptor<T>]? ,@ViewBuilder content: @escaping (T) -> Content) {
        var finalPredicate = ""
        
        switch predicate {
        case .beginsWith: finalPredicate = "BEGINSWITH[c]"
        case .contains: finalPredicate = "CONTAINS"
        }
        
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors ?? [], predicate: NSPredicate(format: "%K \(finalPredicate) %@", filterKey, filterValue))
        print(predicate)
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
