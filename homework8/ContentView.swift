//
//  ContentView.swift
//  homework8
//
//  Created by Nail Kamilov on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea(.all, edges: .all)
                VStack {
                    Text("Welcome to the Game!")
                        .foregroundColor(Colors.white)
                        .font(.system(size: 54, weight: .bold))
                        .multilineTextAlignment(.center)
                    Spacer()
                    //First button
                    NavigationLink(destination: singleGame()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Colors.purple)
                                .frame(width: 358 ,height: 50)
                            Text("Single player")
                                .foregroundColor(Colors.white)
                        }
                    }
                    NavigationLink(destination: multiGame()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Colors.purple)
                                .frame(width: 358 ,height: 50)
                            Text("Multi player")
                                .foregroundColor(Colors.white)
                        }
                    }
                }.navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
