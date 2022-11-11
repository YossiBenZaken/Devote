//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Yosef Ben Zaken on 16/10/2022.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ?.pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    if configuration.isOn {
                        playSound(sound: "sound-rise")
                    } else {
                        playSound(sound: "sound-tap")
                        
                    }
                }
            configuration.label
        }
    }
}
