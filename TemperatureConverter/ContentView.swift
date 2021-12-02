//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Jacobo de Juan Millon on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    @State var temperatureInCelsius = 10.0
    @State var feedback = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Celsius")
                Slider(value: $temperatureInCelsius,
                       in: -50...50,
                       step: 1,
                       label: {
                    Text("Temperature in Celsius")
                },
                       minimumValueLabel: {
                    Text("-50°C")
                },
                       maximumValueLabel: {
                    Text("50°C")
                })
            }
            HStack {
                Spacer()
                Text("\(String(format: "%.1f", temperatureInCelsius))°C")
                Spacer()
            }
            Text("Fahrenheit")
            HStack {
                Spacer()
                Text("\(String(format: "%.1f", temperatureInCelsius * 1.8 + 32))°C")
                Spacer()
            }
            if -50 <= temperatureInCelsius && temperatureInCelsius < -20 {
                feedback = "Dress very warmly!"
            }
            if -20 <= temperatureInCelsius && temperatureInCelsius < 0 {
                feedback = "Dress warmly!"
            }
            if 0 <= temperatureInCelsius && temperatureInCelsius < 10 {
                feedback = "It's cold"
            }
            if 10 <= temperatureInCelsius && temperatureInCelsius < 20 {
                feedback = "It is cool outside"
            }
            if 20 <= temperatureInCelsius && temperatureInCelsius < 30 {
                feedback = "It's a bit hot outside"
            }
            if 30 <= temperatureInCelsius && temperatureInCelsius < 50 {
                feedback = "Stay inside or under a shadow to avoid heatstroke!"
            }
            Text(feedback)
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
