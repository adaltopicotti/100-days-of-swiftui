//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Adalto Picotti Junior on 24/02/23.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity
    let activities: Activities
    
    @State private var test = ""
    
    var body: some View {
        NavigationView {
            //            ZStack(alignment: .leading) {
            //                Color.clear
            VStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title2.bold())
                        Text(activity.description)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Completion")
                                .font(.title2.bold())
                            Text("Completed \(activity.completion) times")
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.bottom)
                    Button {
                        if let index = activities.items.firstIndex(of: activity) {
                            var newItem = self.activity
                            newItem.completion += 1
                            activities.items[index] = newItem
                        }
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                    }
                    .background(.blue)
                    
                    
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    
                    Spacer()
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(.red)
                
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
                
//
//            .frame(minWidth: .infinity)
//            .background(.yellow)
            .navigationTitle(activity.title)
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: Activity(title: "Read", description: "Read at least 1 chapter for day ", completion: 3), activities: Activities())
    }
}
