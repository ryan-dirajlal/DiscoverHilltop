//
//  Help.swift
//  
//  Created by Ryan Dirajlal on 4/8/21.
//

import SwiftUI
import AVKit

struct Help: View {

    var body: some View {
      
//            VideoPlayer(player: AVPlayer(url: URL (string: "https://www.facebook.com/108066499194/videos/628335721034367")!))
//                Spacer()
              //ScrollView {
                List{
                    Text("Click Discover to view a list of all current featured buildings! Tap on any building to read more info, or find the building through Hilltop Map.")
                        Text("Hilltop Map allows you to experience an interactive map to learn about the hilltop area and where buildings are located.")
                        Text("Click on any picture in the map to learn more about the facts and history of any building!")
                        Text("To see acknowledgments, please tap on Sources.")
                        Text("Coming Soon: Search Bar, ability to sort Discover list, more buildings, higher quality photos, more photos of each building, neighborhood parks, video support, and a virtual guided tour!")
                                .foregroundColor(.black)}
                    .navigationTitle("Help")
        
        
    }
}

