//
//  DetailView.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//
import MapKit
import SwiftUI

struct DetailView: View {
    var image: Data
    
    var name: String
    var location: CLLocationCoordinate2D

    var locations: [Location] {
        var loc: [Location] = []
        loc.append(Location(latitude: location.latitude, longitude: location.longitude))
        return loc
    }
//    @State var mapRegion: MKCoordinateRegion
    @State var showingMap = false
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 20, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
//    init(image: Data, name: String, location: CLLocationCoordinate2D, mapRegion: MKCoordinateRegion?) {
//        self.image = image
//        self.name = name
//        self.location = location
//
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
//        print("region: \(region)")
//        self.mapRegion = region
//    }

    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: UIImage(data: image)!)
                .resizable()
                .scaledToFit()
            if showingMap {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) {_ in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        VStack {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 44, height: 44)
                        }
                    }
                }
            }
            
        }
        .ignoresSafeArea()
        .toolbar {
            Button {
                withAnimation {
                    mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    showingMap.toggle()
                }
            } label: {
                Image(systemName: "map.circle")
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(image: Image(), name: "Example", location: CLLocationCoordinate2D(latitude: -23, longitude: -51))
//    }
//}
