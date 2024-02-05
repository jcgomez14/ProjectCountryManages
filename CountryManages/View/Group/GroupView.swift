
import SwiftUI

struct GroupView: View {
    @EnvironmentObject var groupData: UserDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mi Grupo")
                 .font(.title2)
                 .fontWeight(.bold)
                 .padding(.top)
            CardGroupView(groups: groupData.groupData)
            
            Divider()
                
                .padding()
            Text("Actividad")
                .font(.system(size: 18))
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(groupData.groupEvent, id: \.self) { i  in
                            CardActivity(title: i.title, person: i.person, date: i.date)
                    }
                }
            }.padding(.horizontal)
            Divider()
                .padding()
            Spacer()
        }.padding(.horizontal)
        .padding(.top)
        .onAppear() {
            groupData.fetchUserGroup()
            groupData.fetchEventGroup()
        }
    }
}

#Preview {
    GroupView()
        .environmentObject(UserDataViewModel())
}
