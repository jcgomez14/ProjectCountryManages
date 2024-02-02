import SwiftUI

struct ButtonsAlertsView: View {
    
    var alert: AlertsModel
    
    @State var isComunity: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: isComunity ? AnyView(SendAlertView(alert: alert)) : AnyView(SendComunityView(alert: alert))) {
                VStack {
                    Image(systemName: alert.image)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 40, height: 40)
                        .padding(20)
                        .background(alert.color)
                        .cornerRadius(50)
                    Text(alert.title)
                        .font(.system(size: 13))
                        .foregroundColor(Color.primary)
                }
            }
        }
    }
}

#Preview {
    ButtonsAlertsView(alert: AlertsModel(title: "Alerta Prueba", image: "", color: .accent, type: .fire))
}
