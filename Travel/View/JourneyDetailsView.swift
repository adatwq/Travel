//
//  JourneyDetailsView.swift
//  Travel
//
//  Created by Arwa on 13/07/1444 AH.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct JourneyDetailsView: View {
    
    @Binding var origin : City
    @Binding var destination : City
    var TravelVM = TravelViewModel()
    var columns = Array(repeating: GridItem(.fixed(175)), count: 2)
  
    
    var body: some View {
        ZStack {
            Color("Gray")
                .ignoresSafeArea()
        
                Image("World Map")
                    .resizable()
                    .frame(width: 390.0, height: 210.0)
                    .padding(.bottom, 520)
                FlightLineView()
                    .padding(.bottom, 570)
            
            VStack(alignment: .leading, spacing: 50.0) {
                HStack(spacing: 70.0) {
                    VStack {
                        Text(origin.name)
                            .font(.system(size: 27))
                            .fontWeight(.medium)
                        Text(origin.currency)
                    }
                    Text(TravelVM.calculateJourneyDuration(origin: origin.name, destination: destination.name))
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                    VStack {
                        Text(destination.name)
                            .font(.system(size: 27))
                            .fontWeight(.medium)
                        Text(destination.currency)
                    }
                }
                .padding()
                
                Text("Some places to visit")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .padding(.horizontal)
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns){
                        ForEach(destination.places.indices, id: \.self) { place in
                            ZStack {
                                Rectangle()
                                    .frame(width: 162.0, height: 170.0)
                                    .foregroundColor(.black)
                                    .opacity(0.2)
                                    .cornerRadius(8)
                                Image("\(destination.places[place].name)")
                                    .resizable()
                                    .frame(width: 65, height: 155)
                                    .padding(.leading, 90)
                                    .padding(.top, 10)
                                VStack(alignment: .leading) {
                                   Text(destination.places[place].name)
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                    Text(destination.places[place].distance)
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68, height: 25)
                                                .cornerRadius(8)
                                                .foregroundColor(Color("Gray"))
                                            Text("Book Now")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12))
                                                .fontWeight(.regular)
                                        }
                                    }

                                    
                                }
                                .padding(.trailing, 75)
                                .padding(.bottom, 10)
                                .padding(.top)
                                
                                
                            }
                            .padding(.top)
                        }
                    }
                }
                
            }
            .padding(.top, 150)
            
        }.onAppear {
            playSoundEffects()
        }
        .onDisappear {
            stopSoundEffects()
        }
    }
    
    func playSoundEffects() {
        let url = Bundle.main.url(forResource: "airplanet", withExtension: "wav")
        
        // Do nothing if this url is empty
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
           
        } catch {
            print("error")
        }
    }
    
    func stopSoundEffects() {
        let url = Bundle.main.url(forResource: "airplanet", withExtension: "wav")
        
        // Do nothing if this url is empty
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.stop()
           
        } catch {
            print("error")
        }
    }
}
