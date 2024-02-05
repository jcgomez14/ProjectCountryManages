import SwiftUI

struct ReserveView: View {
    @EnvironmentObject var user: UserDataViewModel
    
    var spaces: [String: String]
    
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @Environment (\.presentationMode) var presentationMode
    
    var formattedDate: String {
         let formatter = DateFormatter()
         formatter.dateStyle = .medium
         return formatter.string(from: selectedDate)
     }
    
    var formattedHour: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: selectedTime)
    }
    
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                   
                    Text("Nombre y Apelllido: \(user.userData?.Nombre ?? "") \(user.userData?.Apellido ?? "")")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    Text("Identificacion: \(user.userData?.DNI ?? "")")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    .padding(.vertical)

                    Divider()
                    
                    Text("Seleccion dia y horario  para solicitar la reserva")
                         .font(.system(size: 15))
                         .padding()
                    VStack {
                        HStack {
                            Text("Fecha")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                            DatePicker("" ,selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                                .pickerStyle(.menu)
                                .frame(width: 200)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.accent.opacity(0.1))
                        .cornerRadius(20)
                          
                        HStack {
                            Text("Desde")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                            DatePicker("" ,selection: $selectedTime, in: ...Date(), displayedComponents: .hourAndMinute)
                                .pickerStyle(.menu)
                                .frame(width: 200)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.accent.opacity(0.1))
                        .cornerRadius(20)
                  
                        HStack {
                            Text("Hasta")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                            DatePicker("" ,selection: $selectedTime, in: ...Date(), displayedComponents: .hourAndMinute)
                                .pickerStyle(.menu)
                                .frame(width: 200)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.accent.opacity(0.1))
                        .cornerRadius(20)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)                  
                }
                .frame(maxWidth: .infinity)
            .padding(.horizontal)
            }
            
            Spacer()
            .navigationTitle(spaces["title"] ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: ConfirmationReserveView(date: formattedDate, person: user.userData?.Nombre ?? "", hour: formattedHour, space: spaces["title"] ?? "")){
                Text("Reservar")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(Color.accent)
                    .cornerRadius(5)
                
            })
        }
    }

#Preview {
    ReserveView(spaces: ["title": "Tenis", "image":"tennis.racket"])
}
