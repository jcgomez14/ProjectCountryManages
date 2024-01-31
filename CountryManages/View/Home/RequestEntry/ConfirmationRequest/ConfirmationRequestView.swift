import SwiftUI

struct ConfirmationRequestView: View {
    @EnvironmentObject var appState: AppState
    @Environment (\.presentationMode) var presentationMode
    
    var nombre: String
    var uiImage: UIImage
    
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: uiImage)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
              
            Text("Solicitud confirmada")
                .fontWeight(.bold)
            Text("Comparte este QR con \(nombre) para que pueda ingresar")
                .multilineTextAlignment(.center)
                .font(.subheadline)
            Button(action: {
                AppUtils.shared.shareQRCode(uiImage: uiImage)
            }, label: {
                Text("Compartir invitacion")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.accent)
                    .cornerRadius(10)
            })
            
            Button(action: {
                self.appState.moveToDashboard = true
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Finalizar")
                    .fontWeight(.bold)
                    .foregroundColor(Color.accent)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accent, lineWidth: 2)
                    )
            })
            
            
            .navigationBarBackButtonHidden(true)
        }.padding(.horizontal)
    }
}

#Preview {
    ConfirmationRequestView(nombre: "Juan Cruz", uiImage: UIImage())
        .environmentObject(AppState())
}
