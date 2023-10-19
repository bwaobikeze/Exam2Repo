//
//  FriendsView.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI

struct FriendsView: View {
    @State  var Friendspeoples: [People]
    var body: some View {
        VStack{
            Text("Friends").font(Font.system(size: 45))
            Text("SomeWhere near me").font(Font.system(size: 45))
            List(Friendspeoples, id: \.id){ friends in
                if friends.type == "Friends"{
                    HStack{
                        Text(friends.name)
                        Spacer()
                        Text("\(friends.distance) miles")
                    }
                }
            }
        }
    }
}

#Preview {
    @State var TempOfPeople = [People]()
    return FriendsView(Friendspeoples: TempOfPeople)
}
