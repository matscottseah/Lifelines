//
//  Shape.swift
//  Deadline
//
//  Created by Matthew Seah on 1/15/23.
//

import SwiftUI

enum shapes {
    case circle, square
}

struct Period: View {
    public var id: Int
    public var shape: shapes
    public var color: Color
    public var size: CGFloat
    
    var body: some View {
        Group {
            switch shape {
            case .square:
                Rectangle()
                    .fill(color)
            default:
                Circle()
                    .fill(color)
            }
        }
        .frame(width: size, height: size)
    }
}

struct Period_Previews: PreviewProvider {
    static var previews: some View {
        Period(id: 1, shape: .circle, color: .green, size: 5)
    }
}
