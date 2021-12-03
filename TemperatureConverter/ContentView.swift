//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Jacobo de Juan Millon on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    @State var temperatureInCelsius = 10.0
    var feedback: String {
        if temperatureInCelsius < -20 {
            return "Dress very warmly!"
        }
        if temperatureInCelsius < 0 {
            return "Dress warmly!"
        }
        if temperatureInCelsius < 10 {
            return "It's cold"
        }
        if temperatureInCelsius < 20 {
            return "It is cool outside"
        }
        if temperatureInCelsius < 30 {
            return "It's a bit hot outside"
        }
        return "Stay inside or under a shadow to avoid heatstroke. Stay hydrated."
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Celsius")
                    .bold()
                
                Slider(value: $temperatureInCelsius,
                       in: -50...50,
                       step: 1,
                       label: {
                    Text("Temperature in Celsius")
                },
                       minimumValueLabel: {
                    Text("-50.0°C")
                },
                       maximumValueLabel: {
                    Text("50.0°C")
                })
                HStack {
                    Spacer()
                    Text("\(String(format: "%.1f", temperatureInCelsius))°C")
                    Spacer()
                }
                Text("Fahrenheit")
                    .bold()
                HStack {
                    Spacer()
                    Text("\(String(format: "%.1f", temperatureInCelsius * 1.8 + 32))°F")
                    Spacer()
                }
                Text(feedback)
                    .italic()
            }
            .padding()
        }
        .navigationTitle("Temperature Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
