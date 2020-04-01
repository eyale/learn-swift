//
//  AboutView.swift
//  Bullseye
//
//  Created by Anton Goncharov on 01.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: .black, radius: 5, x: 1, y: 1)
        }
    }
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Georgia", size: 18))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    struct TitleStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Georgia-Bold", size: 22))
                .padding(20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(TitleStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider").modifier(TextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(TitleStyle()).foregroundColor(.pink)
            }
            .background(Color(red: 255/255, green: 214/255, blue: 179/255))
        .cornerRadius(30)
        }
        .background(Image("Background"), alignment: .center)
        .navigationBarTitle("About Bullseye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
