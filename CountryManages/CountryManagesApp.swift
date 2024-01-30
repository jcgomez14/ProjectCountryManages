import SwiftUI

@main
struct CountryManagesApp: App {
    
    let appState = AppState()
    @StateObject var userData = UserDataViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            InitView()
                .environmentObject(appState)
                .environmentObject(userData)
        }
    }
}
