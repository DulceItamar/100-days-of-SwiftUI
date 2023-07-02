//
//  ContentView.swift
//  WordScramble
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score: Int = 0
    @State private var counter: Int = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var endTitle = ""
    @State private var endMessage = ""
    @State private var showingEnd = false
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())
                  ]


    var body: some View {
        NavigationStack {
            
            ZStack {
                
                VStack {
                    
                    Button(action: changeWord) {
                        Label("Change Word", systemImage: "arrow.clockwise")
                            .padding(8)
                            .background(.white)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .tint(.purple)
                    .frame(width: 330, alignment: .trailing)
                    .padding(.vertical,10)
//                    .onTapGesture {
//                        tapping()
//                    }
                    
                    
                    Section{
                        //                   Header
                        VStack {
                            HStack {
                                LetterBannerView(text: "W")
                                LetterBannerView(text: "O")
                                LetterBannerView(text: "R")
                                LetterBannerView(text: "D")
                            }
                            
                            HStack{
                                LetterBanner2View(text: "S")
                                LetterBanner2View(text: "C")
                                LetterBanner2View(text: "R")
                                LetterBanner2View(text: "A")
                                LetterBanner2View(text: "M")
                                LetterBanner2View(text: "B")
                                LetterBanner2View(text: "L")
                                LetterBanner2View(text: "E")
                            }
                        }
                        
                        
                        
                        
                        
                        
                        //                        Root Word
                        Text(rootWord)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 60)
                            .background(.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.black, lineWidth: 2)
                            )
                        
                    }.padding(10)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.purple)
                            .shadow(radius: 10, x: -10, y: -10)
                        
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            TextField("Enter your word", text: $newWord)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding()
                                .frame(width: 300)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color.black, lineWidth: 2)
                                )
                                .padding(.vertical, 40)
                                .shadow(color: .white, radius: 10, x:-5, y: 5)
                            
                            
                            Section{
                              
                                    LazyVGrid(columns: columns) {
                                        ForEach(usedWords, id: \.self) { word in
                                            HStack {
                                                Image(systemName: "\(word.count).circle")
                                                Text(word)
                                            }.padding(8)
                                        }
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .stroke(Color.black, lineWidth: 2)
                                        )
                                    }
                                

                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("Score: ")
                                  
                                BannerView(header: "\(score)")
                              
                             
                            }  .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                        }
                    }
                    
                }
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    
                    Button("OK", role: .cancel, action: isOK)
                    
                } message: {
                    Text(errorMessage)
                }
                .alert(endTitle, isPresented: $showingEnd) {
                    
                    if counter == 7 {
                        Button("Play again", action: startGame)
                    }
                   
                } message: {
                    Text(endMessage)
                }
 
            }
        }
    }
    
    func addNewWord(){
        //lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //exit if the remaining string is empty and word needs to have more than 2 characters
        guard answer.count > 0  else { return }
        
        
        
        //extra validation
        guard isOriginal(word: answer) else {
            wordError(title: "Word use already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "Yo can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard sameRootWord(word: answer) else {
            wordError(title: "It's the same word", message: "You can't use the same word that root word")
            return
        }
        
        guard isTooShort(word: answer) else {
            wordError(title: "It's too short", message: "Try with another word")
            return
        }
        
        scoreGame(word: answer)
        
        
        
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame(){
    
        
        //        1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //            2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                //                3. Split the string up into an array of strings, splitted on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                //                4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                counter += 1
                print(counter)
                //                If we are here everything has worked, so we can exit
              

                return
            }
        }
        //        If we are here then there was a problem - trigger a crash and report the error
        
        fatalError("Could not load start.txt from bundle.")
        
    }
    
    func isOriginal(word: String) -> Bool {
        if !usedWords.contains(word) {
            score += 0
            return true
        }
        return false
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                score += 0
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range  = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        score += 0
        return misspelledRange.location == NSNotFound
    }
    
    func isTooShort(word: String) -> Bool {
        if word.count <= 2 {
            return false
        }
        
        return true
    }
    
    func sameRootWord(word: String) -> Bool{
        let temporalWord = rootWord
        
        if temporalWord == word {
            score += 0
            return false
        }
        
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isOK(){
        print("It's ok!")
    }
    
    //    Score
    func scoreGame(word: String)  {
        
        if word.count >= 3 && word.count < 5 && word != rootWord  {
            score += 10
        } else if word.count >= 5 && word != rootWord {
            score += 30
        }
    }
      
    
    func tapping(){
        print(counter)
    }
    
    func changeWord(){
        
        guard counter != 7 else {
            endTitle = "It's over"
            endMessage = "Your score is \(score). Well done! "
            counter = 0
            showingEnd = true
            return
        }
        
        startGame()
    }
        
    }
     


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
