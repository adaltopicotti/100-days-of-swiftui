//
//  ContentView.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var askPhotoName = false
    @State private var showingImagePicker = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.photoNames) { photoName in
                        NavigationLink {
                            DetailView(image: photoName.image, name: photoName.name, location: photoName.location.coordinate)
                        } label: {
                            HStack {
                                Image(uiImage: UIImage(data: photoName.image)!)
                                    .resizable()
                                    
                                    .frame(width: 75, height: 75)
                                    .background(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                
                                Text(photoName.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                        }
                    }
                }
                .padding()
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $viewModel.inputImage)
                }
                .onChange(of: viewModel.inputImage) { _ in askPhotoName = true }
                .sheet(isPresented: $askPhotoName) {
                    EditView(image: viewModel.image, name: $viewModel.name) {
                        viewModel.addPhotoName()
                    }
                 }
                
            }
            .navigationTitle("Photo Names")
            .toolbar {
                Button {
                    viewModel.locationFetcher.start()
                    showingImagePicker = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
