//
//  PhotoName.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//

import Foundation


struct PhotoName: Identifiable, Codable {
    var id: UUID
    let name: String
    let image: Data
    let location: Location
    

}
