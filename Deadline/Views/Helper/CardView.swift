//
//  Card.swift
//  Deadline
//
//  Created by Matthew Seah on 1/24/23.
//

import SwiftUI

struct CardView: View {
    var content: AnyView
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        content
            .padding()
            .frame(width: width, height: height)
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: AnyView(Text("Placeholder Text")), width: 300, height: nil)
            .background(Color.gray)
    }
}
