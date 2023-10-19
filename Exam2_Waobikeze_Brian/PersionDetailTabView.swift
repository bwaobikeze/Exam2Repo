//
//  PersionDetailTabView.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI
import MapKit

struct PersionDetailTabView: View {
    @State var DiffPeople: People
    var body: some View {
        NavigationView{
            TabView{
                PersonDetailView(PersonName: DiffPeople.name, PersonDistance: DiffPeople.distance, PersonAt: DiffPeople.location, PersonType: DiffPeople.type)
                    .tabItem {
                        Image(systemName: "info.square")
                        Text("Details")
                    }
                PersionMapView(region: MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: DiffPeople.lati, longitude: DiffPeople.longi),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                ), campostion: .automatic, capLat: DiffPeople.lati, capLong: DiffPeople.longi, PersonName: DiffPeople.name)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
            }
        }
    }
}

#Preview {
    var Stas = People(
         id : 0,
        distance: 0,
        type: "",
        name: "",
       location: "",
         lati: 0.0,
         longi: 0.0)
    return PersionDetailTabView(DiffPeople: Stas)
}
