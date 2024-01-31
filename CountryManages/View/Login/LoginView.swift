import SwiftUI

struct LoginView: View {
    @State var identificacion: String = ""
    @State var password: String = ""
    
    @State var loginOk: Bool = false
    @State var createAccount: Bool = false
    
    var body: some View {
                VStack {
                    Text("Iniciar Sesion")
                        .font(.largeTitle)
                        .bold()

                    TextField("Identificacion", text: $identificacion)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.primary.opacity(0.1))
                        .cornerRadius(12)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.primary.opacity(0.1))
                        .cornerRadius(12)
                    Divider()
                        .padding()
                    Button(action: {
                        if
                            LoginService.shared.loginAccount(identificacion: identificacion, password: password) {
                            loginOk = true
                        }
                    }, label: {
                        Text("Iniciar Sesion")
                            .bold()
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accent)
                            .cornerRadius(12)
                    })
                    
                    
                    Button(action: {
                        createAccount = true
                    }, label: {
                        Text("No estoy registrado, crear cuenta")
                    })
                }.fullScreenCover(isPresented: $loginOk, content: {
                    InitView()
                })
                .fullScreenCover(isPresented: $createAccount, content: {
                    RegisterView()
                })
    }
}

#Preview {
    LoginView()
}
