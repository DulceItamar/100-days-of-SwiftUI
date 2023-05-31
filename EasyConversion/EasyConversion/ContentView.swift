//
//  ContentView.swift
//  EasyConversion
//
//  Created by Dulce Itamar Vigueras Ballesteros on 19/05/23.
//

import SwiftUI



struct ContentView: View {
    
    enum SystemOfUnits: String, CaseIterable {
        case temperature = "thermometer.medium"
        case length = "ruler"
        case time = "timer"
        case volume  = "cylinder"
    }
    

    @State var selectedUnit: SystemOfUnits = .length
    
    @State var fromSelectedMeasurementUnit = "m"
    @State var toSelectedMeasurementUnit = "Km"
    @State var value: Double = 0.00

     var input: Double {

        switch fromSelectedMeasurementUnit {
//            time
        case "Seconds":
            return value
        case "Minutes":
            return value * 60
        case "Hours":
            return value * 3600
        case "Days":
            return value * 3600 * 24
//            length
        case "m":
            return value
        case "Km":
            return value * 1000
        case "ft":
            return value * 0.304
        case "yd":
            return value * 0.9144
        case "mi":
            return value * 1609.34
//            Temperature
        case "°C":
            return value
        case "°F":
            return ((5 / 9) * (value - 32))
        case "°K":
            return value - 273.15
//            Volume
        case "ml":
            return value
        case "L":
            return value * 1000
        case "cups":
            return value * 236.588236
        case "pints":
            return value * 473.176473
        case "gal":
            return value * 3785.411784
        default:
            return 0
        }
    }
    
    var output: Double {
 
        switch toSelectedMeasurementUnit {
//            time
        case "Seconds":
            return input
        case "Minutes":
            return input / 60
        case "Hours":
            return input / 3600
        case "Days":
            return input / (3600 * 24)
//            length
        case "m":
            return input
        case "Km":
            return input / 1000
        case "ft":
            return input * 1.093613
        case "yd":
            return input * 3.28084
        case "mi":
            return input / 1609.344
//            Temperature
        case "°C":
            return value
        case "°F":
            return input * (9 / 5) + 32
        case "°K":
            return input + 273.15
//            Volume
        case "ml":
            return input
        case "L":
            return input / 1000
        case "cups":
            return input / 236.588236
        case "pints":
            return input *  0.00211338
        case "gal":
            return input / 3785.41
        default:
            return 0
        }
        
    }
    

    
    
    var body: some View {
        
        
        NavigationStack {
            Form {
                //Which measurement system do you select it?
                Section {
                    Picker(selection: $selectedUnit) {
                        ForEach(SystemOfUnits.allCases, id: \.self) { option in
                            Image(systemName: option.rawValue)
                            
                          
                        }
                    } label: {
                        Text("Conversion of")
                    }.pickerStyle(.segmented)
                        
                }

                Section {
                    
                    //Value
                    HStack {
                        Text("Value:")
                        TextField("Enter a value", value: $value, format: .number).padding(.horizontal, 10)
                    }
                    
                    //From
                    Picker(selection: $fromSelectedMeasurementUnit) {
                        ForEach(selectedUnits(unit: selectedUnit), id: \.self) { selected in
                            Text(selected)
                            
                       
                            
                        }
                    } label: {
                        Text("From:")
                    }.pickerStyle(.segmented)
                } header: {
                    Text("From")
                }
                
                Section {
                    //To
                   
                    HStack {
                        Text("Result:")
                        Text(output, format: .number)
                    }
                    
                    
                    Picker(selection: $toSelectedMeasurementUnit) {
                        ForEach(selectedUnits(unit: selectedUnit), id: \.self) { selected in
                            Text(selected)
                        }
                    } label: {
                        Text("To:")
                    }.pickerStyle(.segmented)
                
                } header: {
                    Text("To")
                }
                

       
                
            }.navigationTitle("Converter")
        }
        
    }
    
    
    
    func selectedUnits(unit: SystemOfUnits) -> [String] {
        switch unit {
        case .length:
            return ["m", "Km", "ft", "yd", "mi"]
        case .temperature:
            return ["°C", "°F", "°K"]
        case .time:
            return ["Seconds", "Minutes", "Hours", "Days"]
        case .volume:
            return ["ml", "L", "cups", "pints", "gal"]
        }
        
        
    }
    
    
//    func differentStructs() -> Double {
//        if selectedUnit == .temperature {
//            let solution = TemperatureCalculation(value: value, inputUnit: fromSelectedMeasurementUnit, outputUnit: toSelectedMeasurementUnit)
//             output = solution.output
//            return output
//        } else if selectedUnit == .length {
//            let solution = LengthCalculation(value: value, inputUnit: fromSelectedMeasurementUnit, outputUnit: toSelectedMeasurementUnit)
//            output = solution.output
//            return output
//        } else if selectedUnit == .volume {
//            let solution = VolumeCalculation(value: value, inputUnit: fromSelectedMeasurementUnit, outputUnit: toSelectedMeasurementUnit)
//            output = solution.output
//            return output
//        } else {
//            let solution = TimeCalculation(value: value, inputUnit: fromSelectedMeasurementUnit, outputUnit: toSelectedMeasurementUnit)
//            output = solution.output
//            return output
//        }
//    }





}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
