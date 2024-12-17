//
//  NoteDetailView.swift
//  Vnotes
//
//  Created by Amr Khalil  on 10/12/24.
//
import SwiftUI
//import AVFoundation

struct NoteDetailView: View {
    let note: Note  // Note object with title and body
    
    // Create a speech synthesizer
    //private let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)
            
            Text(note.body)
                .font(.body)
                .padding()
                //.accessibilityLabel("Created on \(formattedDate(note.dateCreated))")
                .accessibilityLabel("Note body: \(note.body)")
                .accessibilityHint("This is the content of note")
            
            Spacer()
            
            // Button to read the note aloud
           // Button(action: {
              //  readNoteAloud()
          //  }) {
               /// HStack {
                   // Image(systemName: "speaker.wave.2.fill")
                  //  Text("Read Note Aloud")
              //  }
            //    .font(.headline)
              //  .foregroundColor(.white)
             //   .padding()
            //    .background(Color.blue)
              //  .cornerRadius(10)
          ///  }
          //  .padding()
        }
        .padding()
        .navigationTitle("Note Details")
    }
    
    // Function to convert note title and body to speech
   // private func readNoteAloud() {
        //let speechUtterance = AVSpeechUtterance(string: "\(note.title). \(note.body)")
     //   speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate  // Adjust the speech speed
       // speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")  // Set the voice language
        
      //  speechSynthesizer.speak(speechUtterance)  // Start speaking
  //  }
}
