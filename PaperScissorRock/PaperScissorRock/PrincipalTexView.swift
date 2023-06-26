//
//  PrincipalTexView.swift
//  PaperScissorRock
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/23.
//

import SwiftUI

struct PrincipalTexView: View {
    var text : String
    var body: some View {
        Text(text)
            .font(.custom("Montserrat-Bold", size: 30))
            .foregroundColor(Color(red: 220/255, green: 121/255, blue: 149/255))
    
    }
}


struct SecondTextView: View {
    var text : String
    var body: some View {
        Text(text).font(.custom("Montserrat-Regular", size: 20))
            .foregroundColor(Color(red: 220/255, green: 121/255, blue: 149/255))
            
    }
}

struct scoreTextView: View {
    var text : String
    var body: some View {
        Text(text).font(.custom("Montserrat-Bold", size: 20))
            .foregroundColor(Color(red: 220/255, green: 121/255, blue: 149/255))
            
    }
}

struct PrincipalTexView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalTexView(text: "Hello")
    }
}
