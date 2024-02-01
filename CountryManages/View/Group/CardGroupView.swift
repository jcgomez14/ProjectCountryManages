
import SwiftUI

struct CardGroupView: View {
    
    var groups: [GroupModel] = []
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(groups, id: \.self) { i in
                        
                        Image(i.Image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                }.padding()
            }.frame(maxWidth: 300)

            Image(systemName: "bell.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color.accent.opacity(0.7))
                .cornerRadius(14)
                .padding(8)
            
        }.background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

#Preview {
    CardGroupView()
}
