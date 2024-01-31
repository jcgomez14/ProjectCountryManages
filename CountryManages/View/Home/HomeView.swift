
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userData: UserDataViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hola \(userData.userData?.Nombre ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    NavigationLink(destination: RequestEntryView()) {
                        VStack{
                            Image("ingreso")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 130)
                                .cornerRadius(30)
                                Text("Solicitud Ingreso")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.font)
                        }
                    }.isDetailLink(false)
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    
                       
                    Divider()
                    
                    NavigationLink(destination: AuthView()) {
                        VStack{
                            Image("autorizacion")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 130)
                                .cornerRadius(30)
                                Text("Autorizacion Ingreso")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.font)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    
                    Divider()
                    NavigationLink(destination: ReserveSpaceListView()) {
                        VStack{
                            Image("salon")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 130)
                                .cornerRadius(30)
                                Text("Reservar Espacio")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.font)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                }.padding(.top)
                
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Spacer()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserDataViewModel())
    }
}
