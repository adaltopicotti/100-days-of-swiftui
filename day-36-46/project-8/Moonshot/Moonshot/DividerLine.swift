//
//  DividerLine.swift
//  Moonshot
//
//  Created by Adalto Picotti Junior on 19/02/23.
//

import SwiftUI

struct DividerLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerLine_Previews: PreviewProvider {
    static var previews: some View {
        DividerLine()
    }
}
