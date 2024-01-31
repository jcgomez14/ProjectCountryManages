
import SwiftUI

struct GroupView: View {
    @EnvironmentObject var groupData: UserDataViewModel

    var body: some View {
        List(groupData.groupData, id: \.self) { i in
            Text("\(i.Nombre) \(i.Apellido)")
        }
            .padding(.top)
            .onAppear() {
                groupData.fetchUserGroup()
            }
    }
}

#Preview {
    GroupView()
        .environmentObject(UserDataViewModel())
}
