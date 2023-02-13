//
//  FlightLineView.swift
//  Travel
//
//  Created by Alja7dali on 23/01/2023.
//

import SwiftUI


let graphWidth: CGFloat = 0.8  // Graph is 80% of the width of the view
let amplitude: CGFloat = 0.3   // Amplitude of sine wave is 30% of view height


let width: CGFloat = 300
let height: CGFloat = 300
let origin = CGPoint(x: width * (1 - graphWidth) / 2, y: height * 0.50)

struct FlightLineView: View {
    
    @State var objectPosition: CGFloat = 0
    var timer = Timer.publish(every: 0.06125, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Canvas { context, size in
                
                // Draw a square
                var path = Path()
                
                let max: CGFloat = .pi
                let unit: CGFloat = 10 //.pi / 1
                
                path.move(to: origin)
                for angle in stride(from: 5.0, through: 175, by: 5.0) {
                    let x = origin.x + CGFloat(angle/170) * width * graphWidth
                    let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                
                
                
                context.stroke(path, with: .color(.white))
            }
            
            let x = origin.x + CGFloat(objectPosition/170) * width * graphWidth
            let y = origin.y - CGFloat(sin(objectPosition/185.0 * Double.pi)) * height * amplitude
            
            Image("plane")
                .resizable()
                .frame(width: 35, height: 35)
                .position(x: x, y: y)
        }
        .frame(width: 300, height: 300)
        .onReceive(timer) { _ in
            //      timer.upstream.connect().cancel()
            //      withAnimation(.easeInOut) {
            //        appearance.finishedDisplayingSplashScreen = true
            //      }
            
            objectPosition += 5
            if objectPosition > 180 {
                objectPosition = 0
            }
            
        }
    }
}





