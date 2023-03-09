//
//  CircularProgressView.swift
//  Lifelines
//
//  Created by Matthew Seah on 3/3/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let label: String
    let size: CGFloat
    
    var color: Color {
        if progress <= 0.5 { return .green }
        else if progress > 0.5 && progress <= 0.8 { return .orange }
        else { return .red }
    }
    var percentage: Int {
        Int(progress * 100)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Text("\(percentage)%")
                Circle()
                    .stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 5
                    )
                    .frame(width: size, height: size)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        color,
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: size, height: size)
    //                .animation(.easeOut, value: progress)
            }
            Text(label)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.75, label: "Life", size: 75)
    }
}
