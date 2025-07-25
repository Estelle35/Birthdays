//
//  ContentView.swift
//  App
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var friends: [Friend] = [
        Friend(name:  "Taylor", birthday: .now),
        Friend(name: "Frank Ocean", birthday: Date(timeIntervalSince1970:0))
        ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    
    
    var body: some View {
        
        NavigationStack{
            
            List(friends, id:\.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)

                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)

                    DatePicker("Birthday", selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)

                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }

        
            }
        
        
        
        
        }
        
   
    }
    
    


#Preview {
    ContentView()
}
