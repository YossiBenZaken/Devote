//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Yosef Ben Zaken on 16/10/2022.
//

import SwiftUI

struct NewTaskItemView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    @State var task: String = ""
    @Binding var isShowing: Bool
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    @FocusState private var isFocused: Bool
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .focused($isFocused)
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                Button {
                    isFocused = false
                    addItem()
                    playSound(sound: "sound-ding")
                } label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? .blue : .pink)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }
        .padding()
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = false
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            isShowing = false
        }
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
    }
}
