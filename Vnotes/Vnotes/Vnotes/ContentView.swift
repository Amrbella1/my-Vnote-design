//
//  ContentView.swift
//  Vnotes
//
//  Created by Amr Khalil  on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = [] // Array of notes
    @State private var isAddingNote: Bool = false // State for showing AddNoteView

    let columns = [
        GridItem(.flexible()), GridItem(.flexible()) // Two columns
    ]
 
    var body: some View {
        NavigationView {
            VStack {
                if notes.isEmpty {
                    Text("No notes yet")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(notes) { note in
                                NavigationLink(destination: NoteDetailView(note: note)) {
                                    NoteCard(note: note)
                                }
                            }
                        }
                        .padding()
                    }
                }

                Spacer()

                // Add Button
                Button(action: {
                    isAddingNote = true
                }) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("VNote")
            .sheet(isPresented: $isAddingNote) {
                AddNoteView(notes: $notes)
            }
        }
    }
}

// Note Card View
struct NoteCard: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
                .lineLimit(1)
            Text(note.body)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Note Model
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var body: String
    //DATE DATE TIME TIME TIME 
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
