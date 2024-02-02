
import Foundation
import UIKit
import SwiftUI
import AVFoundation
import MobileCoreServices
import UniformTypeIdentifiers

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var imagenSeleccionada: UIImage?

    @Environment(\.dismiss) var dismiss
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePickerView

        init(parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let imagen = info[.originalImage] as? UIImage {
                parent.imagenSeleccionada = imagen
            }

            parent.dismiss()
            
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
          
        }
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        
        
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}


struct CameraPickerView: UIViewControllerRepresentable {
    @Binding var mediaType: String?
    @Binding var mediaData: Data?
    
    @Environment(\.dismiss) var dismiss

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraPickerView

        init(parent: CameraPickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedMediaType = info[.mediaType] as? String {
                parent.mediaType = pickedMediaType

                if pickedMediaType == "public.image" {
                    if let pickedImage = info[.originalImage] as? UIImage {
                        parent.mediaData = pickedImage.jpegData(compressionQuality: 1.0)
                    }
                } else if pickedMediaType == "public.movie" {
                    if let mediaURL = info[.mediaURL] as? URL {
                        do {
                            parent.mediaData = try Data(contentsOf: mediaURL)
                        } catch {
                            print("Error al cargar el video: \(error)")
                        }
                    }
                }
            }

            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.mediaTypes = [UTType.image.identifier as String, UTType.movie.identifier as String]
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
