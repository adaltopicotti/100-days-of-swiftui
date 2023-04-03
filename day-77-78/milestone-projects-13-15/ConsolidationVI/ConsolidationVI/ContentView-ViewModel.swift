//
//  ContentView-ViewModel.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//

import Foundation
import SwiftUI
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var photoNames: [PhotoName]
        @Published var inputImage: UIImage?
        @Published var name = String()
        
        @Published private(set) var locationFetcher = LocationFetcher()
        
        
        private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedImages")
        
        private let context = CIContext()
        
        
        
        var image: Image {
            return Image(uiImage: inputImage!)
        }
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                photoNames = try JSONDecoder().decode([PhotoName].self, from: data)
                print(photoNames)
            } catch {
                photoNames = []
            }
        }
        
        private func save() {
            do {
                let data = try JSONEncoder().encode(photoNames)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addPhotoName() {
            if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                let uuid = UUID()
                let filename = FileManager.documentsDirectory.appendingPathComponent("\(uuid).jpg")
                print(filename)
                do {
                    guard let location = self.locationFetcher.lastKnownLocation else {
                        print("Your locations is unknown")
                        return
                    }
                    try jpegData.write(to: filename)
                    let newPhotoName = PhotoName(id: uuid, name: name, image: jpegData, location: Location(latitude: location.latitude, longitude: location.longitude))
                    photoNames.append(newPhotoName)
                    print(newPhotoName)
                    save()
                } catch {
                    print("")
                }
                
            }
            
            
        }
    }
}
