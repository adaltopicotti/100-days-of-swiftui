//
//  DetailView.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 09/03/23.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        ZStack {

            ScrollView {
                
                VStack(alignment: .leading) {
                    Section {
                        Section("Age") {
                            Text("\(user.age)")
                                .font(.system(size: 20))
                                .padding(.bottom, 2)
                        }
                        Section("Company") {
                            Text("\(user.age)")
                                .font(.system(size: 20))
                                .padding(.bottom, 2)
                        }
                        Section("Email") {
                            Text("\(user.age)")
                                .font(.system(size: 20))
                                .padding(.bottom, 2)
                        }
                        Section("Address") {
                            Text("\(user.age)")
                                .font(.system(size: 20))
                                .padding(.bottom, 2)
                        }
                        Divider()
                        Section("About \(user.friends.count)") {
                            Text(user.about)
                                .font(.system(size: 20))
                                .padding(.bottom, 2)
                            
                        }
                        
                        Section("Registered ") {
                            Text(user.registered.formatted(date: .long, time: .omitted))
                                .font(.subheadline)
                            
                        }
                    }
                    Divider()
                    
                    Section("Friends") {
                        ForEach(user.friends) { friend in
                            Text(" - \(friend.name)")
                                .font(.system(size: 20))
                        }
                    }
                }
            }
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(user: User(id: UUID(uuidString: "50a48fa3-2c0f-4397-ac50-64da464f9954")!, name: "Alford Rodriguez", age: 21, company: "Imkan", isActive: false, email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date.now, tags:  [
            "cillum",
            "consequat",
            "deserunt",
            "nostrud",
            "eiusmod",
            "minim",
            "tempor"
        ], friends: [
            Friend(
                id: UUID(uuidString: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0")!,
            name: "Hawkins Patel"
            ),
            Friend(
                id: UUID(uuidString: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6")!,
            name: "Jewel Sexton"
            ),
            Friend(
                id: UUID(uuidString: "be5918a3-8dc2-4f77-947c-7d02f69a58fe")!,
            name: "Berger Robertson"
            )
        ]))
    }
}
