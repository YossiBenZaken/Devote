//
//  ListRowItemView.swift
//  Devote
//
//  Created by Yosef Ben Zaken on 16/10/2022.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default,value: item.completion)
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}
