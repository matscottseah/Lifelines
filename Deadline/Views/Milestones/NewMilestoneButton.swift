//
//  NewMilestoneButton.swift
//  Deadline
//
//  Created by Matthew Seah on 2/2/23.
//

import SwiftUI

struct NewMilestoneButton: View {
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "plus")
                .font(.system(size: 15).bold())
                .foregroundColor(.black)
                
            Spacer()
        }
    }
}

struct NewMilestoneButton_Previews: PreviewProvider {
    static var previews: some View {
        NewMilestoneButton()
    }
}
