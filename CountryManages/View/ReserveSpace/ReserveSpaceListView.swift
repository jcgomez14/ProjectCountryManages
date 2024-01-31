import SwiftUI

struct ReserveSpaceListView: View {
    
    var spaces: [[String: String]] = [
        ["title": "Salon", "image": "building"],
        ["title": "CoWorking", "image": "brain.head.profile"],
        ["title": "Tenis", "image": "tennis.racket"],
        ["title": "Futbol", "image": "soccerball"],
        ["title": "Padel", "image": "tennisball"]
    ]
    
    var body: some View {
            List(spaces, id: \.self) { i in
                NavigationLink(destination: ReserveView(spaces: i)) {
                    HStack {
                        Image(systemName: i["image"] ?? "")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.accent)
                        Text(i["title"] ?? "")
                    }
                }
            }
            .navigationTitle("Espacios")
            .navigationBarTitleDisplayMode(.inline)
   
    }
}

#Preview {
    ReserveSpaceListView()
}
