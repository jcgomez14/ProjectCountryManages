
import SwiftUI

struct AuthView: View {
    @EnvironmentObject var auth: UserDataViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(auth.authRequest, id: \.NombreEntry) { i in
                    NavigationLink(destination: AcceptAuthView(auth: i)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(i.NombreEntry)
                                Text(i.ApellidoEntry)
                            }.fontWeight(.bold)
                            HStack {
                                Text("Fecha de ingreso")
                                Text(i.DateEntry)
                            }.font(.system(size: 14))
                            Text("Estado: \(i.getAuthString())")
                                .font(.system(size: 14))
                                .bold()
                        }
                    }
                }
            }
            .navigationTitle("Autorizacion Ingreso")
            .navigationBarTitleDisplayMode(.inline)
            
        }.onAppear() {
            auth.fetchAuthRequest()
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(UserDataViewModel())
}
