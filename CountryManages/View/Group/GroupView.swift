
import SwiftUI

struct GroupView: View {
    @EnvironmentObject var groupData: UserDataViewModel

    var body: some View {
        NavigationStack {
                List(groupData.groupData, id: \.self) { i in
                    Text("\(i.Nombre) \(i.Apellido)")
                }.listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear() {
            groupData.fetchUserGroup()
        }
    }
}

#Preview {
    GroupView()
        .environmentObject(UserDataViewModel())
}
