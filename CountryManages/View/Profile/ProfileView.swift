import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var loginService: LoginService
    @EnvironmentObject var userData: UserDataViewModel
    var body: some View {
            List {
                HStack {
                    Image(systemName: "person")
                    Text("Editar Perfil")
                }
                
                HStack {
                    Image(systemName: "person")
                    Text("Mis Autorizaciones")
                }
                
                HStack {
                    Image(systemName: "person")
                    Text("Mis Reservas")
                }
                
                HStack {
                    Image(systemName: "person")
                    Text("Configuracion")
                }
                    Button(action: {
                        loginService.logoutAccount()
                        userData.clearAccount()
                    }, label: {
                        HStack {
                            Image(systemName: "x.circle")
                            Text("Cerrar Sesion")
                        }
                    })
            }
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
        .environmentObject(LoginService())
        .environmentObject(UserDataViewModel())
}
