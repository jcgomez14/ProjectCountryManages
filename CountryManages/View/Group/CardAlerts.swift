import SwiftUI

struct CardAlerts: View {
    
    var alerts: AlertsSendModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(systemName: alerts.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(alerts.title)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }.padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text(alerts.person)
                            .font(.system(size: 18))
                    }
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text(alerts.date)
                            .font(.system(size: 18))
                    }
                }
                
                Spacer()
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                   
            } .padding(.horizontal)
        }.padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
            .background(alerts.color)
            .cornerRadius(14)
            .padding(.horizontal)
            
            .foregroundColor(Color.white)
    }
}

#Preview {
    CardAlerts(alerts: AlertsSendModel(title: "Emergencia", image: "sos", color: .brown, type: .emergency, person: "Jorge Savoretti", latitude: 0.3, longitude: 0.2, date: "5/2/2024"))
}
