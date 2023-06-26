//
//  ContentView.swift
//  BetterRest
//
//  Created by Dulce Itamar Vigueras Ballesteros on 23/06/23.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var numOfCoffes = 0
    
    static var defaultWakeTime : Date {
        
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    let gridItem = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        
      
            NavigationStack {
                
                ZStack {
                    Color(red: 208/255, green: 188/255, blue: 168/255).ignoresSafeArea()
                    
                    ScrollView {
                        VStack {
                            
                            Text("Better Rest")
                                .font(.custom("Montserrat-Bold", size: 45))
                                .fontWeight(.heavy)
                            
                            Section {
                                LazyVGrid(columns: gridItem)  {
                                    ForEach(0...coffeAmount, id: \.self) { _ in
                                        
                                       
                                            Image("coffe-svgrepo-com")
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                             
                                       
                                       
                                    }
                                }.padding(.horizontal,30)
                                    .frame(width: 300, alignment: .center)

                            }
                            
                            Section {
                                
                                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .frame(width: 290, alignment: .center)
                                    .padding(.bottom,20)
                                
                                
                                
                            } header: {
                                Text("When do you want to wake up?")
                                    .font(.custom("Montserrat-Regular", size: 18))
                            }
                            
                            Divider()
                                .frame(width: 300,height: 10)
                            
      
                            
                            Section {
                                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                                    .frame(width: 250)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom,20)
                                
                                
                                
                            } header: {
                                Text("Desired amount of sleep")
                                    .font(.custom("Montserrat-Regular", size: 18))
                            }
                            
                            Divider()
                                .frame(width: 300,height: 10)
                            Section {
                                Picker("", selection: $coffeAmount) {
                                    ForEach(1..<21) { number in
                                        
                                        if number == 1 {
                                            Text("\(number) cup")
                                        } else {
                                            Text("\(number) cups")
                                        }
                                        
                                        
                                    }
                                }.pickerStyle(.wheel)
                                    .frame(width: 320, height: 80)
                                    .padding(.bottom,20)
                            } header: {
                                Text("Daily coffe intake")
                                    .font(.custom("Montserrat-Regular", size: 18))
                            }
                            
                            
    //                        Button to calculate the bedtime
                            Button(action: calculateBedTime) {
                            
                                CalculateButton(text: "Calculate")
                            }
                            
                            
                            
                            
                            //                With a stepper
                            //                Section {
                            //                    Stepper( coffeAmount == 1 ? "\(coffeAmount) cup" : "\(coffeAmount) cups", value: $coffeAmount, in: 1...20)
                            //                } header: {
                            //                    Text("Daily coffe intake")
                            //                }
                        }
                    }
                }
                
//                .toolbar {
//                    Button("Calculate", action: calculateBedTime)
//                }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("Ok"){}
                } message: {
                    Text(alertMessage)
                }
            }
        
    }
    
    func calculateBedTime(){
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute  = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            //Something went wrong!
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
        
    }
}

struct CalculateButton: View {
    var text : String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(red: 107/255, green: 76/255, blue: 65/255))
            .frame(width: 200,height: 70)
            .shadow(radius: 5, x: 10, y: 10)
            
            Text(text).foregroundColor(.white).fontWeight(.bold)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
