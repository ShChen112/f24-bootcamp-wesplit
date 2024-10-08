//
//  ContentView.swift
//  Price Spliter
//
//  Created by Sherry Chen on 10/2/24.
//

import SwiftUI
struct ContentView: View {
    @State var amount = Double()
    @State var numberOfPeople = Int()
    @State var chosenTipPercent = Int()
    @State var customTip = Double()
    let tipPercent = [0, 10, 15, 20, 25]
    var totalWithTip: Double {
            switch chosenTipPercent {
            case 0:
                return amount
            case 10:
                return amount * 1.1
            case 15:
                return amount * 1.15
            case 20:
                return amount * 1.2
            default:
                return amount * 1.25
            }
        }
    var averagePerPerson: Double {
        return totalWithTip / Double(numberOfPeople)
    }
    var averagePerPersonCustom: Double {
        return totalWithCustomTip / Double(numberOfPeople)
    }
    var totalWithCustomTip: Double {
        return amount + customTip
    }
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(colors: [.pink.opacity(0.3), .blue.opacity(0.5)],
                                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    Form {
                        TextField("Amount", value: $amount, format: .number)
                        TextField("Amount", value: $numberOfPeople, format: .number)
                        Section("How much tip do you want to leave?"){
                            Picker("Tip Percent", selection: $chosenTipPercent){
                                ForEach(tipPercent, id: \.self) { tip in Text("\(tip)%")
                                }
                            }
                            
                        }
                        Section("Custom Tip:"){
                            TextField("Custom Tip", value: $customTip, format: .number)
                        }
                        Section("Check Toatl with Tip:"){
                            if customTip > 0 {
                                Text("$\(totalWithCustomTip, specifier: "%.2f")")
                            } else {
                                Text("$\(totalWithTip, specifier: "%.2f")")
                            }
                        }
                        Section("Average per Person:"){
                            if customTip > 0 {
                                Text("$\(averagePerPersonCustom, specifier: "%.2f")")
                            } else {
                                Text("$\(averagePerPerson, specifier: "%.2f")")
                            }
                        }
                    }
                    .navigationTitle("WeSplit")

                    .pickerStyle(.segmented)
                   
                }
            }
            
        }
        
    }
}
#Preview {
    ContentView()
}
