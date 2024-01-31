import SwiftUI

struct InitView: View {
    
    @EnvironmentObject var userData: UserDataViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationBarItems(
                        leading: leadingNavigationBar(),
                        trailing: trailingNavigationBar()
                    )
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Inicio")
            }

            NavigationView {
                GroupView()
                    .navigationBarItems(
                        leading: leadingNavigationBar(),
                        trailing: trailingNavigationBar()
                    )
            }
            .tabItem {
                Image(systemName: "person.2.fill")
                Text("Grupo")
            }

            NavigationView {
                AlertsView()
                    .navigationBarItems(
                        leading: leadingNavigationBar(),
                        trailing: trailingNavigationBar()
                    )
            }
            .tabItem {
                Image(systemName: "megaphone.fill")
                Text("Alertas")
            }

            NavigationView {
                Text("Comunidad")
                    .navigationBarItems(
                        leading: leadingNavigationBar(),
                        trailing: trailingNavigationBar()
                    )
            }
            .tabItem {
                Image(systemName: "map.fill")
                Text("Comunidad")
            }
        }
        .accentColor(Color.accent)
        .onAppear() {
            userData.fetchDataUserDefaults()
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}



extension InitView {
   
    func leadingNavigationBar() -> some View {
        return  Image("logo")
            .resizable()
            .scaledToFill()
            .foregroundColor(Color.accent)
            .frame(width: 50, height: 50)
    }
    
    func trailingNavigationBar() -> some View {
        return NavigationLink(destination: ProfileView()) {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(10)
                .background(Color.accent)
                .cornerRadius(50)
        }
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
