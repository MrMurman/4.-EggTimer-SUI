//
//  ContentView.swift
//  4. EggTimer-SUI
//
//  Created by Андрей Бородкин on 26.01.2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var welcomeMessage: String = "How do you like your eggs?"
    @State var time = Time()
    @State var player: AVAudioPlayer!
    @State var eggs = Egg.allEggs
    
    
    
    var body: some View {
        ZStack {
            Color("eggBlue")
            VStack {
                Spacer()
                Text((time.secondsLeft == 0) ? welcomeMessage : String(format: "%.0f", time.secondsLeft)+" seconds left")
                    .font(.system(.title, weight: .bold))
                
                Spacer()
                
                HStack {
                    ForEach(0..<eggs.count) { egg in
                        EggView(egg: $eggs[egg], secondsLeft: $time.secondsLeft, secondsPassed: $time.secondsPassed, totalTime: $time.totalTime, player: $player)
                    }
                   
                }
                .scaledToFit()
                .disabled(time.secondsLeft > 0)
                                
                Spacer()
                
                ProgressView(value: time.secondsLeft, total: eggs[2].timeToCook)
                    .background(Color.gray)
                    .tint(Color.yellow)
                    .overlay(
                        HStack {
                            Text(String(format: "%.0f", {
                                if time.secondsPassed > 0 {
                                    return time.secondsPassed / time.totalTime * 100
                                } else {
                                    return 0
                                }
                            }()))
                            Text(" %")
                        }
                            .offset(x: 0, y: 30)
                            .font(.system(.title, design: .rounded, weight: .bold))
                        )
                Spacer()
            }
        .padding()
        }
        .ignoresSafeArea()
    }
             
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
