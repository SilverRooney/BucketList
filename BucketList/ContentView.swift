//
//  ContentView.swift
//  BucketList
//
//  Created by Silver on 7/28/22.
//

import MapKit
import SwiftUI

// needs to be Identifiable because multiple map markers
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
   //property to store maps state
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    //define array of locations wherever we want to add map annotations to appear
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            //MapMarker(coordinate: location.coordinate)
            MapAnnotation(coordinate: location.coordinate) {
                VStack {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
                    Text(location.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
