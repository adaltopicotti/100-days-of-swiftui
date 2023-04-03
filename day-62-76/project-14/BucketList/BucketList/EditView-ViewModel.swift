//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Adalto Picotti Junior on 22/03/23.
//

import Foundation

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name = String()
        @Published var description = String()
        
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()
        
        
     
        
        
//        init(name: String, description: String, loadingState: LoadingState = LoadingState.loading, pages: [Page] = [Page]()) {
//            self.name = name
//            self.description = description
//            self.loadingState = loadingState
//            self.pages = pages
//        }
    }
}
