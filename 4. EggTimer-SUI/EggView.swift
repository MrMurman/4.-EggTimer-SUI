//
//  EggView.swift
//  4. EggTimer-SUI
//
//  Created by Андрей Бородкин on 26.01.2023.
//

import SwiftUI
import AVFoundation

struct EggView: View {
    
    @Binding var egg: Egg
    @Binding var secondsLeft: Double
    @Binding var secondsPassed: Double
    @Binding var totalTime: Double
    
    @Binding var player: AVAudioPlayer!
    
    var body: some View {
        Image(egg.imageName)
            .resizable()
            .onTapGesture {
                startTimer(for: egg.timeToCook)
            }
    }
    
    func startTimer(for seconds: Double) {
        totalTime = seconds
        secondsLeft = seconds
               
        var _  = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            
            if secondsLeft > 0 {
                
            secondsLeft -= 1
                secondsPassed += 1

            } else {
                playAlarm()
                secondsPassed = 0
                timer.invalidate()
            }
        }
    
    }
    
    func playAlarm() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        guard let url = url else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
            print("There should be sound!!!")
        } catch {print("mmmm")}
    }
}



