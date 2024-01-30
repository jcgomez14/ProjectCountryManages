import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
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
            }
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
