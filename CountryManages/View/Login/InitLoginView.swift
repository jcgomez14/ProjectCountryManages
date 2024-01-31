import SwiftUI

struct InitLoginView: View {
    
    @State var createAccount: Bool = false
    @State var loginAccount: Bool = false
    
    
    var body: some View {
        VStack {
        Text("Bienvenido a Country Manages")
            .font(.title2)
            .bold()
            .padding()
            .multilineTextAlignment(.center)
            
             
            Button(action: {
                loginAccount = true
            }, label: {
                Text("Iniciar Session")
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(Color.accent)
                    .cornerRadius(12)
                
            })
            
            Button(action: {
                createAccount = true
            }, label: {
                Text("Crear cuenta")
                    .foregroundColor(Color.accent)
                    .bold()
                    .padding(12)
                
            })
             
             
        }.fullScreenCover(isPresented: $createAccount, content: {
            RegisterView()
        })
        
        .fullScreenCover(isPresented: $loginAccount, content: {
            LoginView()
        })
    }
}

#Preview {
    InitLoginView()
}
