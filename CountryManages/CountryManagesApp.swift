import SwiftUI

@main
struct CountryManagesApp: App {
    
    let appState = AppState()
    @StateObject var userData = UserDataViewModel()
    @StateObject var loginService = LoginService()
    
    var body: some Scene {
        WindowGroup {
          
            if loginService.isAccountLogin {
                InitView()
                    .environmentObject(appState)
                    .environmentObject(userData)
                    .environmentObject(loginService)
            } else {
                InitLoginView()
                    .environmentObject(appState)
                    .environmentObject(userData)
                    .environmentObject(loginService)
            }
        }
    }
}
