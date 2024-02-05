
import SwiftUI
import MapKit

struct AlertsGroupView: View {
    
    var alerts: AlertsSendModel
    
    @State var coordinate: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), latitudinalMeters: 0.01, longitudinalMeters: 0.01)
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $coordinate)
                .ignoresSafeArea()
            
                .overlay(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: alerts.image)
                            Text(alerts.title)
                        }.padding(.horizontal)
                            .padding(.top, 5)
                        
                        HStack {
                            Image(systemName: "person")
                            Text(alerts.person)
                        }.padding(.horizontal)
                        
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(alerts.date)
                        }.padding(.horizontal)
                            .padding(.bottom, 5)
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .background(alerts.color)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                        .foregroundColor(Color.white)
                }
            
                .onAppear() {
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    self.coordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.alerts.latitude, longitude: self.alerts.longitude), span: span)
                }
            
            
            
            
                .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    AlertsGroupView(alerts: AlertsSendModel(title: "Estoy aqui", image: "mappin", color: Color.indigo, type: .here, person: "Roxana Gonzalez", latitude: -32.2285, longitude:  -59.9763, date: "25/12/2023"))
}
