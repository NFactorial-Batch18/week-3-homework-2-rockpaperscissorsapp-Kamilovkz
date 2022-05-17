//
//  singleGame.swift
//  homework8
//
//  Created by Nail Kamilov on 12.05.2022.
//

import SwiftUI

enum Choice {
    
    case rock
    case paper
    case scissors
    case none
}

enum Colors{
    
    static let purple = Color(red: 103/255, green: 80/255, blue: 164/255)
    static let white = Color(red: 255/255, green: 255/255, blue: 255/255)
    static let capsule = Color(red: 243/255, green: 242/255, blue: 248/255)
}

struct singleGame: View {
    @State private var choice: Choice = .none
    @State var isPaperViewVisible = true
    @State var isScissorsViewVisible = true
    @State var isRockViewVisible = true
    @State var isChoiceBtnVisible = false
    @State var isLoading = false
    var pick: Choice = .paper
    @State var playerScore = 0
    @State var opponentScore = 0
    @State var roundNumber = 1
    var body: some View {
        ZStack {
            VStack {
                Group {
                    if choice != .none {
                        TopTitle(title: "Your pick", color: .white)
                            .navigationTitle("Round #\(roundNumber)")
                    } else {
                        TopTitle(title: "Take your pick", color: .white)
                            .navigationTitle("Round #\(roundNumber)")
                    }
                }.padding(.bottom, 12)
                Text("Score \(playerScore):\(opponentScore)")
                    .foregroundColor(Colors.purple)
                    .font(.system(size: 17))
                    .padding(.bottom, 74)
                VStack {
                    Button {
                        choice = .paper
                        isChoiceBtnVisible = true
                    } label: {
                        RoundedEmojiButton(emoji: "📃")
                            .opacity(isPaperViewVisible == true ? 1 : 0)
                    }
                    Button {
                        choice = .scissors
                        isChoiceBtnVisible = true
                    } label: {
                        RoundedEmojiButton(emoji: "✂️")
                            .opacity(isScissorsViewVisible == true ? 1 : 0)
                    }
                    Button {
                        choice = .rock
                        isChoiceBtnVisible = true
                    } label: {
                        RoundedEmojiButton(emoji: "🗿")
                            .opacity(isRockViewVisible == true ? 1 : 0)
                    }
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        resultScreen()
                    }
                }
            
                Spacer()
                
                Button {
                    choice = .none
                    isChoiceBtnVisible = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Colors.purple)
                            .frame(width: 358, height: 50, alignment: .center)
                        Text("I changed my mind")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        }
                    .opacity(isChoiceBtnVisible == false ? 0 : 1)
                    }
                }
            }
        .onChange(of: choice) { choice in
            manageChoiceViewsVisibility(choice)
        
    }
}

        
    func manageChoiceViewsVisibility(_ choice: Choice) {
        switch choice {
        case .rock:
            isPaperViewVisible = false
            isScissorsViewVisible = false
        case .scissors:
            isPaperViewVisible = false
            isRockViewVisible = false
        case .paper:
            isRockViewVisible = false
            isScissorsViewVisible = false
        case .none:
            isScissorsViewVisible = true
            isRockViewVisible = true
            isPaperViewVisible = true
        }
    }
}
struct RoundedEmojiButton: View {
    @State var emoji: String
    var body: some View {
        ZStack {
            Capsule()
                .fill(Colors.capsule)
                .frame(width: 342, height: 128)
            Text(emoji)
                .frame(width: 294, height: 80, alignment: .center)
                .font(.system(size: 80))
        }.padding(.bottom, 24)
    }
}

struct TopTitle: View {
    let title: String
    let color: Color
    var body: some View {
        Text(title)
            .foregroundColor(color)
            .font(.system(size: 54, weight: .bold))
            .multilineTextAlignment(.center)
    }
}

struct singleGame_Previews: PreviewProvider {
    static var previews: some View {
        singleGame()
    }
}
