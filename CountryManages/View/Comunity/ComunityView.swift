
import SwiftUI

struct ComunityView: View {
    
    var alertsComunity = ConfigManager.shared.alertsComunity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Alertas")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 16)], spacing: 16) {
                    ForEach(alertsComunity, id: \.self) { alert in
                        ButtonsAlertsView(alert: alert, isComunity: false)
                    }
                }
            }
            
            Divider()
                .padding(.vertical)
            Text("Eventos")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<10) { i  in
                        CardActivity()
                    }
                }
            }
            
        }.padding()
        Spacer()
    }
}

#Preview {
    ComunityView()
}
