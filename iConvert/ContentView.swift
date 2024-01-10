//
//  ContentView.swift
//  iConvert
//
//  Created by Mark Strijdom on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = 0.0
    @State private var selectedConversionFromOption = "seconds"
    @State private var selectedConversionToOption = "seconds"
    @State private var result = 0.0
    
    let conversionOptions = ["seconds", "minutes", "hours", "days"]
    
    @FocusState private var numberIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Number to convert", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                } header: {
                    Text("number to convert")
                }
                
                Section {
                    Picker("Convert from", selection: $selectedConversionFromOption) {
                        ForEach(conversionOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("convert from")
                }
                
                Section {
                    Picker("Convert to", selection: $selectedConversionToOption) {
                        ForEach(conversionOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("convert to")
                }
                
                Section {
                    Text("\(userInput) \(selectedConversionFromOption) is \(result) \(selectedConversionToOption).")
                } header: {
                    Text("result")
                }
            }
            .navigationTitle("iConvert")
            .toolbar {
                if numberIsFocused {
                    Button("Done") {
                        numberIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
