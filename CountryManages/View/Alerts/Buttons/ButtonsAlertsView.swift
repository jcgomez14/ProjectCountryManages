import SwiftUI

struct ButtonsAlertsView: View {
    
    var alert: AlertsModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: SegundaPantalla()) {
                VStack {
                    Image(systemName: alert.image)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 60, height: 60)
                        .padding(20)
                        .background(alert.color)
                        .cornerRadius(50)
                    Text(alert.title)
                        .font(.system(size: 15))
                        .foregroundColor(Color.primary)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    ButtonsAlertsView(alert: AlertsModel(title: "Alerta Prueba", image: "", color: .accent, type: .fire))
}
