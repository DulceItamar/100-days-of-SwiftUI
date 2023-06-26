//
//  SelectedImageView.swift
//  PaperScissorRock
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/23.
//

import SwiftUI

struct SelectedImageView: View {
    var image : String
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 100, height: 100)
            .background(.white)
            .clipShape(Circle())
            .shadow(radius: 10, x: 10)
            .padding(.horizontal, 5)

    }
}

struct SelectedComputerImageView: View {
    var image : String
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 200, height: 200)
            .background(.white)
            .clipShape(Circle())
            .shadow(radius: 10, x: 10)
            .padding(.horizontal, 5)

    }
}



struct SelectedImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SelectedComputerImageView(image: "house")
            SelectedImageView(image: "house")
        }
        
    }
}
