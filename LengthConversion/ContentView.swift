//
//  ContentView.swift
//  LengthConversion
//
//  Created by Woodrow Martyr on 29/8/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "ft"
    
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $inputValue, format: .number).keyboardType(.decimalPad)
                }
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
