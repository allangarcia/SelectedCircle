//
//  ContentView.swift
//  SelectedCircle
//
//  Created by Allan Garcia on 27/01/23.
//

import SwiftUI

enum SelectedColor {
    case red
    case blue
    case green
    case none
}

struct ContentView: View {
    
    @State private var selectedColor: SelectedColor = .none
    
    var body: some View {
        GeometryReader { geometry in
            let minSize = min(geometry.size.height, geometry.size.width) * 0.5
            let offset = minSize * 1.2
            ZStack {
                Color.white.zIndex(-100) // background
                if selectedColor != .none {
                    Color.black
                        .opacity(0.9)
                        .zIndex(selectedColor != .none ? 50 : 0)
                        .onTapGesture { selectedColor = .none }
                } // Fade out
                Circle()
                    .fill(Color.red)
                    .zIndex(selectedColor != .none && selectedColor == .red ? 100 : 0)
                    .onTapGesture { selectedColor = .red }
                    .offset(y: offset)
                    .frame(width: minSize, height: minSize)
                Circle()
                    .fill(Color.blue)
                    .zIndex(selectedColor != .none && selectedColor == .blue ? 100 : 0)
                    .onTapGesture { selectedColor = .blue }
                    .frame(width: minSize, height: minSize)
                Circle()
                    .fill(Color.green)
                    .zIndex(selectedColor != .none && selectedColor == .green ? 100 : 0)
                    .onTapGesture { selectedColor = .green }
                    .offset(y: -offset)
                    .frame(width: minSize, height: minSize)
            }
            .ignoresSafeArea(.all)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
