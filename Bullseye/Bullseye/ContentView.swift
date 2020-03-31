//
//  ContentView.swift
//  Bullseye
//
//  Created by Anton Goncharov on 30.03.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            // Target row
            Text("Welcome to my first SwiftUI App")
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
            // slider row
            
            // button row
            Button(action: {
                print("tapped")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Tap"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible ) {
                () -> Alert in
                    return Alert(
                        title: Text("Hi"),
                        message: Text("You tapped the button"),
                        dismissButton: .default(Text("Close"))
                    )
            }
            // score row
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
