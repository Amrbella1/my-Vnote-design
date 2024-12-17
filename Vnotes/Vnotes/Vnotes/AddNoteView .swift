//
//  AddNoteView .swift
//  Vnotes
//
//  Created by Amr Khalil  on 06/12/24.
//

import SwiftUI

struct AddNoteView: View {
    @Binding var notes: [Note] // Binding to update the notes in ContentView
    @Environment(\.dismiss) var dismiss // Environment variable to close the sheet
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Title", text: $noteTitle)
                    .font(.title)
                    .padding()
                
                TextEditor(text: $noteBody)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Spacer()
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveNote()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveNote() {
        if !noteTitle.isEmpty || !noteBody.isEmpty {
            notes.append(Note(title: noteTitle, body: noteBody)) // Add new note
        }
        dismiss() // Dismiss the sheet
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a constant binding for preview purposes
        AddNoteView(notes: .constant([]))
    }
}


