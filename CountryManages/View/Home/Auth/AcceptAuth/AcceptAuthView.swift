import SwiftUI

struct AcceptAuthView: View {
    @State var auth: AuthModel
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Solicitud ingreso")
                .fontWeight(.bold)
                VStack(alignment: .center) {
                    Text("\(auth.NombreEntry) \(auth.ApellidoEntry)")
                    Text("DNI: \(auth.DNIEntry)")
                    Text("Fecha: \(auth.DateEntry)")
                        
                }.padding(.horizontal)
                .font(.system(size: 15))
                .fontWeight(.bold)
            
            Divider()
        
            Text("Propietario")
                .fontWeight(.bold)
                VStack(alignment: .center) {
                    Text("\(auth.Nombre) \(auth.Apellido)")
                    Text("DNI: \(auth.DNI)")
                    Text("Propiedad: \(auth.Codigo)")
                        
                }.padding(.horizontal)
                .font(.system(size: 15))
                .fontWeight(.bold)
            
            
            Divider()
            if auth.Auth == 0 {
                Text("Una vez autorizado o denegado el ingreso, en caso de querer cambiar el estado del mismo debera solicitarlo via email")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                HStack(spacing: 50) {
                    Button(action: {
                        print("Denegar")
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Denegar")
                            .fontWeight(.bold)
                            .foregroundColor(Color.accent)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accent, lineWidth: 2)
                            )
                    })
                    Button(action: {
                        print("Autorizar")
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Autorizar")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.accent)
                            .cornerRadius(10)
                    })
                  
                }
            } else {
                Text("La solicitud ha sido \(auth.getAuthString()), en caso de querer cambiar el estado del mismo debera solicitarlo via email")     .multilineTextAlignment(.center)
                    .font(.subheadline)
            }
            
            
            
      
        }.padding(.horizontal)
    }
}






#Preview {
    AcceptAuthView(auth: AuthModel(CuentaId: "", Id: "", Nombre: "Juan", Apellido: "G", DNI: "357483", Email: "", Telefono: "123422431", Imei: "", Codigo: "", Admin: true, NombreEntry: "Jorge", ApellidoEntry: "R", DateEntry: "121432", DNIEntry: "123123", Auth: 1))

}
