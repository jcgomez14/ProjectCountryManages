import SwiftUI
import MapKit
import CoreLocation

@MainActor
class LocationViewModel: NSObject, ObservableObject {
    
    @Published var region = MKCoordinateRegion()
    @Published var location: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100.0
        locationManager.requestAlwaysAuthorization()
   //     locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return  }
            self.location = location
        
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            self.region = MKCoordinateRegion(center:location.coordinate, span: span)
    }
}
