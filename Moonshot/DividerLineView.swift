//
//  DividerLineView.swift
//  Moonshot
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/09/23.
//

import SwiftUI

struct DividerLineView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerLineView_Previews: PreviewProvider {
    static var previews: some View {
        DividerLineView()
    }
}
