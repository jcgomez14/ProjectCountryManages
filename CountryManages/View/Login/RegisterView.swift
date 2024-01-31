
import SwiftUI


struct RegisterView: View {
    
    @EnvironmentObject var loginService: LoginService
    
    
    @State var nombre: String = ""
    @State var identificacion: String = ""
    @State var telefono: String = ""
    @State var email: String = ""
    @State var repeatPassword: String = ""
    @State var password: String = ""
    
    @State var createOk = false
    @State var loginAccount = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Registrarse")
                    .font(.largeTitle)
                    .bold()
                TextField("Nombre y Apellido", text: $nombre)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                
                TextField("Identificacion", text: $identificacion)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                TextField("Telefono", text: $telefono)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                SecureField("Repetir Password", text: $repeatPassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(12)
                
                Divider()
                    .padding()
                Button(action: {
                    if
                        LoginService.shared.createAccount(nombre: nombre, identificacion: identificacion, email: email, telefono: telefono, password: password, repeatPassword: repeatPassword) {
                        
                        loginService.isAccountLogin = true
                        
                    }
                }, label: {
                    Text("Crear cuenta")
                        .bold()
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accent)
                        .cornerRadius(12)
                })
                
                
                Button(action: {
                    loginAccount = true
                }, label: {
                    Text("Ya estoy registrado")
                })
                
            }
        }.fullScreenCover(isPresented: $loginAccount, content: {
            LoginView()
        })
        
    }
}

#Preview {
    RegisterView()
}
