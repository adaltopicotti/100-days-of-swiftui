//
//  ContentView.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 09/03/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var users = [User]()
    
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            VStack {
                if cachedUsers.count > 0 {
                    ForEach(cachedUsers, id:\.self) { user in
                        Section(user.name ?? "Unknown") {
                            ForEach(user.friendArray) { friend in
//                                Text("\(friend.wrappedName)")
                                Text("1")
                            }
                        }
                    }
                    
                    
                }
                
                List(users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title2)
                            
                            Text(user.isActive ? "Active" : "Inactive")
                                .font(.subheadline)
                        }
                    }
                    .padding(.vertical)
                    
                }
                Button("Cache") {
                    cache()
                }
            }
            .navigationTitle("Friend Face")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                if users.isEmpty {
//                    await loadData()
                    await MainActor.run {
                         
//                            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CachedUser")
//                        let managedObjectUsers = try! moc.fetch(fetchRequest) as! [User]
//                            let codableUsers = managedObjectUsers.map { User.init(cached: $0)}
//
//                            print(codableUsers)
//                            users = codableUsers
                    }
//
                }
            }
        }
    }
    
    func cache() {
        users.forEach { user in
            do {
                
                let cachedUser = CachedUser(context: moc)
                cachedUser.id = user.id
                cachedUser.name = user.name
                cachedUser.about = user.about
                cachedUser.registered = user.registered
                cachedUser.isActive = user.isActive
                cachedUser.tags = user.tags.joined(separator: ",")
            
                user.friends.forEach { friend in
                    let cachedFriend = CachedFriend(context: moc)
                    cachedFriend.origin = cachedUser
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
//                    try? moc.save()
                }
                
                print(cachedUser)
                print(cachedUser.friend ?? [])
                try moc.save()
                
                
                
            } catch {
                print("Error on moc")
            }
        }
            
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decoded = try? decoder.decode([User].self, from: data) {
                users = decoded
                
                
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
