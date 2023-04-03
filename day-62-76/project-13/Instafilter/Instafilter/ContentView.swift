//
//  ContentView.swift
//  Instafilter
//
//  Created by Adalto Picotti Junior on 11/03/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {

    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    private var hasImage: Bool {
        if processedImage == nil || inputImage == nil {
            return false
        } else {
            return true
        }
    }
    
    private var hasFilterIntesity: Bool {
        if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
            return true
        }
        return false
    }
    
    private var hasFilterRadius: Bool {
        if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
            return true
        }
        return false
    }
    
    private var hasFilterScale: Bool {
        if currentFilter.inputKeys.contains(kCIInputScaleKey) {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                VStack {
                    if hasFilterIntesity {
                        HStack {
                            Text("Intesity")
                            Slider(value: $filterIntensity)
                                .onChange(of: filterIntensity) { _ in applyProcessing() }
                        }
                    }
                    if hasFilterRadius {
                        HStack {
                            Text("Radius")
                            Slider(value: $filterRadius)
                                .onChange(of: filterRadius) { _ in applyProcessing() }
                        }
                    }
                    if hasFilterScale {
                        HStack {
                            Text("Scale")
                            Slider(value: $filterScale)
                                .onChange(of: filterScale) { _ in applyProcessing() }
                        }
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                        .disabled(hasImage == false)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Dot Screen") { setFilter(CIFilter.dotScreen()) }
                Button("Cancel", role: .cancel) {  }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context .createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
