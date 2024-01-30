import SwiftUI

struct RequestEntryView: View {
    @State var nombre: String = ""
    @State var identificacion: String = ""
    @State var patente: String = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var uiImage = UIImage()
    
    var formattedDate: String {
         let formatter = DateFormatter()
         formatter.dateStyle = .medium
         return formatter.string(from: selectedDate)
     }
    
    @EnvironmentObject var appState: AppState
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                   Text("Completa los campos para solicitar un ingreso")
                        .font(.system(size: 15))
                        .padding()
                    
                    Text("Nombre y Apelllido")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    TextField("Nombre y Apellido", text: $nombre)
                        .textFieldStyle(.roundedBorder)
                    
                    .padding(.vertical)
                    Text("Identificacion: DNI/Cedula")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    TextField("DNI/Cedula", text: $identificacion)
                        .textFieldStyle(.roundedBorder)

                    .padding(.vertical)
                    Text("Identificacion Vehiculo")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    TextField("Patente", text: $patente)
                        .textFieldStyle(.roundedBorder)
                    
                    Divider()
                    VStack {
                        HStack {
                            Text("Fecha de ingreso")
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
                            Text("Horario de ingreso")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                            DatePicker("" ,selection: $selectedDate, in: ...Date(), displayedComponents: .hourAndMinute)
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
            .navigationTitle("Solicitud Ingreso")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: 
                                    NavigationLink(destination: ConfirmationRequestView(nombre: nombre, uiImage: uiImage)){
                Text("Solicitar")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(Color.accent)
                    .cornerRadius(5)
                
            }.task {
                uiImage =  AppUtils.shared.generateQR(from: "\(nombre)\n\(identificacion)\n\(patente)\n\(selectedDate)\n\(selectedTime)")
            })
        }.onReceive(appState.$moveToDashboard) { moveToDashboard in
            if moveToDashboard {
                presentationMode.wrappedValue.dismiss()
                self.appState.moveToDashboard = false
            }
        }
    }
}

struct RequestEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RequestEntryView()
            .environmentObject(AppState())
    }
}
