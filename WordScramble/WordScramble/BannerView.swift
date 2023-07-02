//
//  BannerView.swift
//  WordScramble
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/06/23.
//

import SwiftUI

struct BannerView: View {
    var header: String
    
    var body: some View {
        
        Text(header)
                    .padding()
                    .background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.black, lineWidth: 2)
                    )

    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(header: "Dulce")
    }
}
