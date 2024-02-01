
import SwiftUI

struct CardActivity: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "bell")
                    Text("Solicitud de ingreso")
                        .fontWeight(.bold)
                }
                HStack {
                    Image(systemName: "person")
                    Text("Juan Cruz Gomez")
                }
                HStack {
                    Image(systemName: "calendar")
                    Text("1/12/2023")
                }
            }
            Image(systemName: "plus.circle")
        }.padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}

#Preview {
    CardActivity()
}
