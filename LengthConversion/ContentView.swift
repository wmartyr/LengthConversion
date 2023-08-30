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
    @State private var outputValue = 0.0
    
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    
    var convertInputToMetres: Double {
        switch inputUnit {
        case "m":
            return inputValue
        case "km":
            return inputValue * 1000
        case "ft":
            return inputValue * 0.3048
        case "yd":
            return inputValue * 0.9144
        case "mi":
            return inputValue * 1609.34
        default:
            return inputValue
        }
    }
    
    var convertMetresToOutput: Double {
        switch outputUnit {
        case "m":
            return convertInputToMetres
        case "km":
            return convertInputToMetres / 1000
        case "ft":
            return convertInputToMetres / 0.3048
        case "yd":
            return convertInputToMetres / 0.9144
        case "mi":
            return convertInputToMetres / 1609.34
        default:
            return convertInputToMetres
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $inputValue, format: .number).keyboardType(.decimalPad)
                }header: {
                    Text("Input Value")
                }
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
                Section {
//                    Text(convertMetresToOutput.formatted())
                    Text(String(format: "%.2f",convertMetresToOutput))
                } header: {
                    Text("Output Value")
                }
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
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
