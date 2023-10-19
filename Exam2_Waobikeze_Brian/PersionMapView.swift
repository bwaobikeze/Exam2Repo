//
//  PersionMapView.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI
import MapKit

struct PersionMapView: View {
    @State private var region: MKCoordinateRegion
    @State var campostion: MapCameraPosition
    @State private var placemarkinfo: CLPlacemark?
    @State private var selectionMarker: Int?
    @State var capLat:Double
    @State var capLong: Double
    @State var PersonName:String
    init(region: MKCoordinateRegion, campostion: MapCameraPosition, placemarkinfo: CLPlacemark? = nil, selectionMarker: Int? = nil, capLat: Double, capLong: Double, PersonName: String) {
        _region = State(initialValue: region)
        _campostion = State(initialValue: campostion)
        _placemarkinfo = State(initialValue: placemarkinfo)
        _selectionMarker = State(initialValue: selectionMarker)
        _capLat = State(initialValue: capLat)
        _capLong = State(initialValue: capLong)
        _PersonName = State(initialValue: PersonName)
    }
    var body: some View {
        NavigationView{
                       Map(position:  $campostion, selection: $selectionMarker){
                           Marker(PersonName, coordinate: CLLocationCoordinate2D(latitude: capLat, longitude: capLong))
                               .tag(1)
                       }
                   .padding(.bottom, 15)
                   .onAppear(){
                       campostion = .region(region)
                   }
                   .onChange(of: selectionMarker){
                       lookupCurrentLocation(Latitude: capLat, Longitude: capLong){
                           placemark in
                           placemarkinfo = placemark
                       }
                   }
        }
    }
    func lookupCurrentLocation(Latitude: Double, Longitude:Double, completionHandler: @escaping (CLPlacemark?) -> Void){
          let LastLocation = CLLocation( latitude: Latitude, longitude: Longitude)
          let geocoder = CLGeocoder()
          
          geocoder.reverseGeocodeLocation(LastLocation, completionHandler: {(placemarks, error) in
              if error == nil{
                  let firstLocation = placemarks?[0]
                  completionHandler(firstLocation)
              }
              else{
                  completionHandler(nil)
              }
          })
      }
}

#Preview {
    PersionMapView(region: MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ), campostion: .automatic, capLat: 0.0, capLong: 0.0, PersonName: "")
}
