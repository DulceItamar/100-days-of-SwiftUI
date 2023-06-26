//
//  FrameScoreView.swift
//  PaperScissorRock
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/23.
//

import SwiftUI

struct FrameScoreView: View {
    
    var score : Int
    var body: some View {
        Text("\(score)")
            .font(.custom("Montserrat-Bold", size: 36))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(width: 120, height: 80)
            .background(Color(red: 237/255, green: 219/255, blue: 222/255))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5, x: 10)
    }
}

struct FrameScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FrameScoreView(score: 10)
    }
}
