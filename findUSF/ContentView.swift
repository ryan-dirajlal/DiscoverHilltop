//
//  ContentView.swift
//

import MapKit
import SwiftUI
import SDWebImageSwiftUI 

struct ContentView: View {
   @State var location: Location
    @State var items : [Any] = []
    @State var sheet = false
 

    
    
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7765, longitude: -122.4489),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
    )
    

    var body: some View {

        
        
        //POTENTIALLY make this a variable so we dont have to write it each time:
//       let image = WebImage(url: URL(string: location.heroPicture))
//
//            // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
//            .onSuccess { image, data, cacheType in
//                // Success
//                // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
//            }
//
//            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
//
//            .placeholder(Image(systemName: "photo")) // Placeholder Image
//            // Supports ViewBuilder as well
//            .placeholder {
//                Rectangle().foregroundColor(.gray)
//            }
//            .indicator(.activity) // Activity Indicator
//            .transition(.fade(duration: 0.5)) // Fade Transition with duration
//            .scaledToFit()
       
     //   let lat = location.latitude
       // let long = location.longitude
            
                ScrollView {
                    VStack
                    {
//                        ScrollView(.horizontal , showsIndicators: false)
//                        {
//                            HStack{
//
//                        ForEach(picture, id:\.self) { picture in
//                            Image(picture)
//                                .resizable()
//                                .frame(width: 90.0, height: 90.0)
//                               // .scaledToFit()
//                        }
//                            }
//                        }
//
//                    Image(location.heroPicture)
//                        .resizable()
//                        .scaledToFit()
                        WebImage(url: URL(string: location.heroPicture))
                            
                           // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                           .onSuccess { image, data, cacheType in
                               // Success
                               // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                           }
                            
                           .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                            
                           .placeholder(Image(systemName: "photo")) // Placeholder Image
                           // Supports ViewBuilder as well
                           .placeholder {
                               Rectangle().foregroundColor(.gray)
                           }
                           .indicator(.activity) // Activity Indicator
                           .transition(.fade(duration: 0.5)) // Fade Transition with duration
                           .scaledToFit()
                           
                    
                        HStack{
                    Text(location.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                            
//                            Button(action: {
//                                //adding items to be shared...
//                                
//                             
//                                items.removeAll()
//                                items.append(UIImage(named : location.heroPicture)!)
//                                
//                                
//                                sheet.toggle()
//                                
//                                
//                            }, label : {
//                                Image(systemName: "square.and.arrow.up")
//                            })
                            
                        }
                        
                   
                        
                        
                    Text(location.country)
                        .font(.title)
                        .foregroundColor(.secondary)
                       
                        
                    Text("Accessible By: " + location.advisory)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        .padding()

                    Text(location.description)
                        .padding(.horizontal)

                    Text("Fun Facts:")
                        .font(.title3)
                        .bold()
                        .padding(.top)
                        
                        Text(location.more)
                            .padding(.horizontal)
                        
                        
                        //Additional building photos
//                        Text("More Images:")
//                            .font(.title3)
//                            .bold()
//                            .padding(.top)
//                        ScrollView(.horizontal , showsIndicators: false)
//                        {
//                            HStack{
//
//                        ForEach(picture, id:\.self) { picture in
//                            Image(picture)
//                                .resizable()
//                                .frame(width: 150.0, height: 120.0)
//                                .cornerRadius(18.0)
//                               // .scaledToFit()
//
//                        }
//                            }
//                        }
                        
                    
                        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
                            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                                NavigationLink(destination: ContentView(location: location)) {
//                                    Image(location.heroPicture)
//                                        //CHANGE IMAGE CODE HERE^
//                                        .resizable()
//                                        .cornerRadius(8)
//                                        .frame(width: 80, height: 40)
//                                        .shadow(radius: 3)
//
                                    WebImage(url: URL(string: location.heroPicture))
                                        
                                       // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                                       .onSuccess { image, data, cacheType in
                                           // Success
                                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                                       }
                                        
                                       .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                        
                                       .placeholder(Image(systemName: "photo")) // Placeholder Image
                                       // Supports ViewBuilder as well
                                       .placeholder {
                                           Rectangle().foregroundColor(.gray)
                                       }
                                       .indicator(.activity) // Activity Indicator
                                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                       
                                       .frame(width: 80, height: 45, alignment: .center)
                                        .clipShape(
                                        RoundedRectangle(cornerRadius: 8))
                                        .scaledToFit()

                                }
                                
                            }
                            
                        }
                       // .resizable()
                        .scaledToFit()
                        
                       
                }
                .navigationTitle("More Info")
                    
            }
            
            .sheet(isPresented: $sheet, content: {
                
                ShareSheet(items:items)
                
            })
        
            
        }
    
    
}







//Share sheet

struct ShareSheet : UIViewControllerRepresentable {
    
    //the data needed to share
   
    
    var items : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController{
    
        
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(location: Location.example)
        }
    }
}
