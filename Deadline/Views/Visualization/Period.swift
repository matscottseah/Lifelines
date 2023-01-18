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
    }
}

struct Period_Previews: PreviewProvider {
    static var previews: some View {
        Period(id: 1, shape: .circle, color: .green)
    }
}
