//
//  ComputerFrameView.swift
//  PaperScissorRock
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/23.
//

import SwiftUI

struct ComputerFrameView: View {
    var body: some View {
        Circle()
            .fill(Color(red: 237/255, green: 219/255, blue: 222/255))
            .frame(width: 280)
            .shadow(radius: 10, x: 10)
            .padding(.vertical, 20)
    }
}

struct ComputerFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ComputerFrameView()
    }
}
