//
//  ContactManager.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI
import ContactsUI


// MARK: - Contact Picker
struct ContactPicker: UIViewControllerRepresentable {
    
    var onDone: (String?) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
    
    // Coordinator to handle delegate methods
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPicker
        
        init(_ parent: ContactPicker) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
            parent.onDone((contactProperty.value as? CNPhoneNumber)?.stringValue)
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            parent.onDone(nil)
        }
    }
}
