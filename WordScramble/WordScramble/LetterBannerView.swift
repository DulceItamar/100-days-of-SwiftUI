//
//  LetterBannerView.swift
//  WordScramble
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/06/23.
//

import SwiftUI

struct LetterBannerView: View {
    
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(3)
            .frame(width: 40, height: 40)
            .background(.purple)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
                .shadow(color: .black, radius: 10, x: -3, y: -3)
            )
    }
}

struct LetterBanner2View: View {
    
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.purple)
            .padding(3)
            .frame(width: 40, height: 40)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
            )
           
    }
}

struct LetterBannerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LetterBannerView(text: "W")
            LetterBanner2View(text: "W")
        }
    }
}
