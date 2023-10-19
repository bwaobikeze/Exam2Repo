//
//  ContentView.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var DifferentPeople = [People]()
    var body: some View {
        NavigationView{
        VStack {
            Text("Everyone").font(Font.system(size: 45))
            NavigationLink(destination: FilterSelect(peoples: DifferentPeople)){
                Text("Somewhere near me").font(Font.system(size: 45))
            }
            List(DifferentPeople, id: \.id){ person in
                NavigationLink(destination: PersionDetailTabView(DiffPeople: person)){
                HStack{
                    Text(person.name)
                    Spacer()
                    Text("\(person.distance) miles")
                }
            }
            }
            
        }
        .task {
            await loadData()
        }
        .padding()
    }
    }
    func loadData() async {
        guard let url = URL(string: "https://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/people.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([People].self, from: data)
            DifferentPeople=decodedResponse
        } catch {
            print("Error trying to decode JSON object: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
