import SwiftUI

struct ConfirmationReserveView: View {
    
    var date: String
    var person: String
    var hour: String
    var space: String
    
    @Environment (\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.green)
            Text(space)
                .font(.title)
                .bold()
                
            Text("Reserva confirmada")
            
            Text("Para: \(person)")
            Text("Dia: \(date) \(hour)")
            
                .padding(.bottom)
            
            Button(action: {

                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Finalizar")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.accent)
                    .cornerRadius(12)
            })

            .navigationBarBackButtonHidden(true)
                
        }
    }
}

#Preview {
    ConfirmationReserveView(date: "1/12/2024", person: "Juan Cruz", hour: "13:00", space: "Tenis")
}
