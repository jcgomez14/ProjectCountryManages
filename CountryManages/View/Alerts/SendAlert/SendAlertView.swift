import SwiftUI
import MapKit


struct SendAlertView: View {
    
    @StateObject var location = LocationViewModel()
    
    @Environment (\.presentationMode) var presentationMode

    @State var hiddenTab: Bool = true
    @State var viewShow: Bool = true
    
    @State var text: String = ""
    
    @State var showGalery: Bool = false
    @State var showCamera: Bool = false

    @State private var mediaType: String? = nil
    @State private var mediaData: Data? = nil
    @State private var imagenSeleccionada: UIImage?
    
    
    var alert: AlertsModel?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $location.region, showsUserLocation: true)
                .ignoresSafeArea()
                .onTapGesture {
                    viewShow = true
                }
                .overlay(alignment: .bottom) {
                                        
                    // View Alert Card
                    if viewShow {
                        VStack {
                            Text(alert?.title ?? "Alerta")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(5)
                            Divider()
                            
                            Text("Recibieron tu alerta")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            HStack {
                                VStack {
                                    Image(systemName: "person")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                    
                                    Text("Central de monitoreo")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                }.frame(width: 80)
                                
                                VStack {
                                    Image(systemName: "person")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                    
                                    Text("Grupo C14")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                }.frame(width: 80)
                                
                            }.frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            
                            
                            Text("Incluye fotos, videos, audios o mensajes a tu aviso de emergencia. Seran recibidos por la central de monitoreo")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 14))
                                .padding(5)
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    viewShow.toggle()
                                }, label: {
                                    VStack {
                                        Image(systemName: "text.bubble")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(alert?.color ?? Color.accent)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(50)
                                        Text("Mensajes")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                })
                                
                                Button(action: {
                                    showGalery = true
                                  
                                }, label: {
                                    VStack {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(alert?.color ?? Color.accent)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(50)
                                        Text("Galeria")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                })
                                
                                Button(action: {
                                    
                                }, label: {
                                    VStack {
                                        Image(systemName: "phone.and.waveform")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(alert?.color ?? Color.accent)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(50)
                                        Text("Audio")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                })
                                Button(action: {
                                    showCamera = true
                                   
                                }, label: {
                                    VStack {
                                        Image(systemName: "camera")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(alert?.color ?? Color.accent)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(50)
                                        Text("Camara")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                })
                            }
                            
                            Divider()
                            Button {
                                hiddenTab = false
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Finalizar")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding(12)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(12)
                            }
                            .padding()
                            
                            
                            
                        }.frame(maxWidth: .infinity)
                            .background(alert?.color ?? Color.accent)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        
                    } else {
                        // View Media Button
                        
                        // ACTION TEXT
                        VStack {
                            HStack {
                                Text("Escriba aqui su mensaje")
                                Spacer()
                                Button {
                                    viewShow.toggle()
                                } label: {
                                    Image(systemName: "paperplane.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(Color.white)
                                        .padding(12)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                }
                                
                            }
                            .font(.system(size: 14))
                            .italic()
                            TextEditor(text: $text)
                                .frame(height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2)
                                )
                        }.padding(.horizontal)
                            .padding(.bottom, 40)
                    }
                }
              
                .navigationBarHidden(true)
                .toolbar(hiddenTab ? .hidden : .visible, for: .tabBar)
            
        }.sheet(isPresented: $showGalery) {
            NavigationView {
            ImagePickerView(imagenSeleccionada: $imagenSeleccionada, showGalery: $showGalery)
                    .toolbar(.visible)
                    .navigationBarHidden(true)
           }
            
        }
        
        
        .sheet(isPresented: $showCamera) {
            NavigationView {
            CameraPickerView(mediaType: $mediaType, mediaData: $mediaData, showCamera: $showCamera)
                    .toolbar(.visible)
                    .navigationBarHidden(true)
            }
        }
        
    }
}

#Preview {
    SendAlertView()
}
