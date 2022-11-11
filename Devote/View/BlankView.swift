//
//  BlankView.swift
//  Devote
//
//  Created by Yosef Ben Zaken on 16/10/2022.
//

import SwiftUI

struct BlankView: View {
    let backgroundColor: Color
    let backgroundOpacity: Double
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .ignoresSafeArea()
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea())
    }
}
