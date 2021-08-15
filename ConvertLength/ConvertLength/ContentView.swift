//
//  ContentView.swift
//  ConvertLength
//
//  Created by Brandon Wong on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var conversionChoice = 0
    @State private var feet = ""
    @State private var inches = ""
    @State private var meters = ""
    
    let conversions = ["Feet to meters", "Meters to feet"]
    
    var feetToMeters: Double {
        let nFeet = Double(feet) ?? 0
        let nInches = Double(inches) ?? 0
        
        let totalInches: Double = (nFeet * 12) + nInches
        return totalInches * 0.0254
    }
    
    var metersToFeet: (Int, Int) {
        let nMeters = Double(meters) ?? 0
        let nCentimeters = nMeters * 100
        
        var sumInches = nCentimeters / 2.54
        sumInches.round()
        let totalInches = Int(sumInches)
        let nFeet = totalInches / 12
        let nInches = totalInches % 12
        
        return (nFeet, nInches)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose Conversion")) {
                    Picker("Conversion", selection: $conversionChoice) {
                        ForEach(0 ..< conversions.count) {
                            Text("\(conversions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                

                if conversionChoice == 0 {
                    Section {
                        HStack {
                            TextField("Feet", text: $feet)
                                .keyboardType(.decimalPad)
                            Divider()
                            TextField("Inches", text: $inches)
                                .keyboardType(.decimalPad)
                        }
                    }
                    
                    Section {
                        Text("\(feetToMeters, specifier: "%.2f") meters")
                    }
                } else {
                    Section {
                        TextField("Meters", text: $meters)
                            .keyboardType(.decimalPad)
                    }
                    
                    Section {
                        Text("\(metersToFeet.0)' \(metersToFeet.1)\"")
                    }
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
