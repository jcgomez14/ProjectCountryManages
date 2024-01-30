import SwiftUI

struct AlertsView: View {
    
    var alerts = ConfigManager.shared.alerts
    
    var body: some View {
        NavigationStack {
            
            VStack() {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 16)], spacing: 16) {
                    ForEach(alerts, id: \.self) { alert in
                        ButtonsAlertsView(alert: alert)
                    }
                }
            }
        }
        
    }
    
}

#Preview {
    AlertsView()
}
