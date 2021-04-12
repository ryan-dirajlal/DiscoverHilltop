//
//  discoverView.swift
//  findUSF
//
//  Created by Ryan Dirajlal on 4/9/21.
//

import SwiftUI

struct discoverView: View {
    //@State var location: Location
  //   @State var items : [Any] = []
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    
    var body: some View {
        
        NavigationView { List(locations) { location in
                NavigationLink(
                    destination: ContentView(location: location)) {
                    Image(location.heroPicture)
                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 71, height: 50)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 5)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.black, lineWidth: 1)
                                        )

                    VStack(alignment: .leading) {
                                    Text(location.name)
                                        .font(.headline)
                        Text(location.country)
                                   
                    }
                    .padding(11)
                   
                }
                
            }
        .navigationBarTitle("Discover the Hilltop")
        
      
        
    }
        .navigationBarHidden(true)
        
        
}
  

}



