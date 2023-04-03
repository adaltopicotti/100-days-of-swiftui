//
//  EditView.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var image: Image?
    
    @Binding var name: String
    
    var onSave: () -> Void
    
    
    var body: some View {
        NavigationView {
            Form {
                //        VStack {
                
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                
                
                Section("Name") {
                    TextField("Photo's name", text: $name)
                }
                
                Section {
                    Button {
                        onSave()
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .listRowInsets(EdgeInsets())
                    
                }
                .background(.blue)
            }
        }
        .navigationTitle("Photo's name")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditView_Previews: PreviewProvider {
    var name = "Example"
    
    static var previews: some View {
        EditView(image: Image("Example"), name: .constant("") ) {  }
    }
}
