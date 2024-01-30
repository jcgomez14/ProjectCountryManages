import SwiftUI

struct InitView: View {
    var body: some View {
        NavigationStack {

        
            // MARK: TAB BAR
            TabView {
                // Vista de la primera pestaña
                NavigationView {
                    HomeView()
                }.tabItem {
                        Image(systemName: "house.fill")
                        Text("Inicio")
                    }
                
                // Vista de la segunda pestaña
                NavigationView {
                    GroupView()
                }.tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Grupo")
                    }

                // Vista de la segunda pestaña
                NavigationView{
                    AlertsView()
                    
                }.tabItem {
                        Image(systemName: "megaphone.fill")
                        Text("Alertas")
                    }
                
                
                // Vista de la segunda pestaña
                Text("Comunidad")
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Comunidad")
                    }
            }.accentColor(Color.accent)
            
            
            
            // MARK: Navigation Components
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarItems(leading:
                                    Image("logo")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color.accent)
                .frame(width: 50, height: 50)
                                , trailing:
                                    NavigationLink(destination: ProfileView()) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(Color.accent)
                    .cornerRadius(50)
            })
            
        }
        
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}

struct SegundaPantalla: View {
    var body: some View {
        VStack {
            Text("¡Hola desde la segunda pantalla!")
        }
        .navigationTitle("Segunda Pantalla")
    }
}
