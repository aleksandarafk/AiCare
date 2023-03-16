//
//  VexiMap.swift
//  AiCare
//
//  Created by Yoana Ivanova on 12/03/2023.
//

import SwiftUI
import MapKit

struct AiCareMap: View {
    @State private var selectedLanguage: Int = {
        let languageCode = Locale.current.languageCode
        if languageCode == "bg" {
            return 1
        } else if languageCode == "nl" {
            return 2
        } else {
            return 0
        }
    }()
    let languages = ["en", "bg", "nl"]
    @State private var directions: [String] = []
    @State private var showDirections = false
    var body: some View {
        VStack {
            MapViews(directions: $directions)
            Button(action: { self.showDirections.toggle()
            }, label: {
                Text("directions_btn".localizableString(languages[selectedLanguage]))
            })
            .disabled(directions.isEmpty)
            .padding(.bottom, -10)
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("hospitals".localizableString(languages[selectedLanguage]))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("hospital_info".localizableString(languages[selectedLanguage]))
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                    Divider()
                    VStack{
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("Catharina Ziekenhuis")
                                .padding()
                                .font(.body)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.leading)
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("Catharina Ziekenhuis")
                                .padding()
                                .font(.body)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.leading)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(16)
                }
                .padding()
                .background(Color("cyan"))
                .cornerRadius(16)
                .ignoresSafeArea()
            }
            .padding(.top, 16)
            .padding(.bottom, 32)
            
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("directions".localizableString(languages[selectedLanguage]))
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color.gray)
                
                List(0..<self.directions.count, id:\.self) { i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
}

struct MapViews: UIViewRepresentable {
    @Binding var directions: [String]
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    typealias UIViewType = MKMapView
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.4433908, longitude: 5.4791711),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        
        let pin1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 51.4433908, longitude: 5.4791711), addressDictionary: nil)
        let pin1Annotation = MKPointAnnotation()
        pin1Annotation.coordinate = pin1.coordinate
        pin1Annotation.title = "Your Location"
        
        let pin2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 51.465305 , longitude: 5.471921), addressDictionary: nil)
        let pin2Annotation = MKPointAnnotation()
        pin2Annotation.coordinate = pin2.coordinate
        pin2Annotation.title = "Catharina Ziekenhuis"
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: pin1)
        request.destination = MKMapItem(placemark: pin2)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate{response, error in
            guard let route = response?.routes.first else {return}
            mapView.addAnnotations([pin1Annotation, pin2Annotation])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated:true)
            self.directions = route.steps.map {$0.instructions}.filter {!$0.isEmpty}
        }
        
        return mapView
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
    }
}


struct AiCareMap_Previews: PreviewProvider {
    static var previews: some View {
        AiCareMap()
    }
}

