//
//  Card.swift
//  Deadline
//
//  Created by Matthew Seah on 1/24/23.
//

import SwiftUI

struct Card: View {
    var title: String
    var content: AnyView
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(title)
                    .font(.title3)
                    .bold()
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                .padding(.bottom)
            }
            content
        }
            .padding()
            .frame(width: width, height: height)
            .background(.white)
            .cornerRadius(10)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "Title", content: AnyView(Text("Placeholder Text")), width: 300, height: nil)
            .background(Color.red)
    }
}
