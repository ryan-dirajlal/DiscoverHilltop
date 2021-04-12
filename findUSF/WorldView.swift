//
//  WorldView.swift
//

import MapKit
import SwiftUI

struct WorldView: View {
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7761, longitude: -122.4507),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
    )
   

    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.heroPicture)
                        //CHANGE IMAGE CODE HERE^
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                    
                }
                
            }
        }
        .navigationTitle("Hilltop Map")
        
        
        
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
