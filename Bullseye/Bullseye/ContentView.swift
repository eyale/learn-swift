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
    @State var sliderValue: Float = 50.0
    @State var targetValue: Int = Int.random(in: 1...100)
    @State var score: Int = 0
    @State var round: Int = 1
    let pink = Color(red: 245/255, green: 20/255, blue: 102/255)
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: .black, radius: 5, x: 1, y: 1)
        }
    }
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.white)
                .font(Font.custom("Helvetica-Light", size: 18))
                .modifier(Shadow())
        }
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.yellow)
                .font(Font.custom("Helvetica", size: 20))
                .modifier(Shadow())
        }
    }
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Helvetica-Bold", size: 18))
        }
    }
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.black)
                .font(Font.custom("Helvetica-Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            // Target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(targetValue)").modifier(ValueStyle())
            }
            Spacer()
            // slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100, step: 1).accentColor(.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            // button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!").modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible ) {
                () -> Alert in
                    return Alert(
                        title: Text(getAlertsTitle()),
                        message: Text(
                            "Current value = \(sliderValueRounded()) \n" +
                            "You scored \(pointsForCurrentRond()) points for this round"
                        ),
                        dismissButton: .default(Text("Close")) {
                            self.score +=  self.pointsForCurrentRond()
                            self.targetValue = Int.random(in: 1...100)
                            self.round += 1
                        }
                    )
            }
            .background(Image("Button")).modifier(Shadow())
            // score row
            Spacer()
            HStack() {
                Button(action: {
                    self.startOver()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start over").modifier(ButtonSmallTextStyle())
                    }
                }
                .alert(isPresented: $alertIsVisible ) {
                    () -> Alert in
                        return Alert(
                            title: Text("Hi"),
                            message: Text("You tapped the button"),
                            dismissButton: .default(Text("Close"))
                        )
                }
                .background(Image("Button")).modifier(Shadow())
                .accentColor(pink)

                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                
                Spacer()
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallTextStyle())
                    } 
                }
                .background(Image("Button")).modifier(Shadow())
                .accentColor(pink)
                .navigationBarTitle("Bullseye")
            }
            .padding(.bottom, 50)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    func getDiffAmount() -> Int {
        abs(sliderValueRounded() - targetValue)
    }
    func pointsForCurrentRond() -> Int {
        let maxScore: Int = 100
        let difference: Int = getDiffAmount()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    func getAlertsTitle() -> String {
        let points: Int = getDiffAmount()
        var title: String = ""
        switch points {
        case 75..<100:
            title = "Are you tried?"
        case 50..<75:
            title = "Not even close"
        case 25..<50:
            title = "Try again"
        case 2..<25:
            title = "Not bad"
        case 1:
            title = "Almost"
        case 0:
            title = "CONGRATULATIONS"
            
        default:
            return title
        }
        return title
    }
    func startOver() {
        alertIsVisible = false
        sliderValue = 50.0
        targetValue = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
