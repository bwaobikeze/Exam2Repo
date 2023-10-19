//
//  PersonDetailView.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI

struct PersonDetailView: View {
    @State var PersonName: String = ""
    @State var PersonDistance: Int = 0
    @State var PersonAt: String = ""
    @State var PersonType: String = ""
    var body: some View {
        
        VStack{
            Text("\(PersonName)").font(Font.system(size: 45))
            Spacer()
            Text("Distance: \(PersonDistance)").font(Font.system(size: 35))
            Text("AT: \(PersonAt)").font(Font.system(size: 35))
            Spacer()
            Text("You are: \(PersonType)").font(Font.system(size: 35))
            Spacer()
        }
    }
}

#Preview {
    PersonDetailView()
}
