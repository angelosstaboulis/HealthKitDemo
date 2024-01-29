//
//  ContentView.swift
//  HealthKitDemo
//
//  Created by Angelos Staboulis on 29/1/24.
//

import SwiftUI
import HealthKit
struct ContentView: View {
    let store = HKHealthStore()
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    Text("BloodType")
                    Text(HealthKitHelper.shared.getBloodType())
                }
                Section{
                    Text("Biological Sex")
                    Text(HealthKitHelper.shared.getBiologicalSex())
                }
                Section{
                    Text("Date of Birth")
                    Text(HealthKitHelper.shared.getDateOfBirth())
                }
                Section{
                    Text("WheelChar in Use")
                    Text(HealthKitHelper.shared.getWheelChair())
                }
            }.navigationTitle("HealthKitDemo")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear(perform: {
            HealthKitAuthentication.shared.permissions()
        })
        
    }
}

#Preview {
    ContentView()
}
