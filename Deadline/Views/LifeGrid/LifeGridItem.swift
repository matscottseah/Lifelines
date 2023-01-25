//
//  LifeGridItem.swift
//  Deadline
//
//  Created by Matthew Seah on 1/15/23.
//

import SwiftUI

struct LifeGridItem: View {
    public var id: Int
    public var color: Color
    public var size: CGFloat
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
    }
}

struct LifeGridItem_Previews: PreviewProvider {
    static var previews: some View {
        LifeGridItem(id: 1, color: .green, size: 5)
    }
}
