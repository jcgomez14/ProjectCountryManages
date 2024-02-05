import SwiftUI

struct CardActivity: View {
    
    var title: String
    var person: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "bell")
                    Text(title)
                        .fontWeight(.bold)
                }
                HStack {
                    Image(systemName: "person")
                    Text(person)
                }
                HStack {
                    Image(systemName: "calendar")
                    Text(date)
                }
            }
            Image(systemName: "plus.circle")
        }.padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}

#Preview {
    CardActivity(title: "Solicitud de Ingreso", person: "Juan Cruz Gomez", date: "1/12/2023")
}
