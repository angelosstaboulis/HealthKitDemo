//
//  HealthKitAuthentication.swift
//  HealthKitDemo
//
//  Created by Angelos Staboulis on 29/1/24.
//

import Foundation
import HealthKit
class HealthKitAuthentication{
    let store = HKHealthStore()
    static let shared = HealthKitAuthentication()
    private init(){}
    func permissions(){
        let dateOfBirthCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: .dateOfBirth)
        let biologicalSexCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: .biologicalSex )
        let bloodTypeCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: .bloodType)
        let wheelCharCharacteristic = HKCharacteristicType.characteristicType(forIdentifier: .wheelchairUse)
        let dataTypesToRead = NSSet(objects:dateOfBirthCharacteristic!,biologicalSexCharacteristic!,bloodTypeCharacteristic!,wheelCharCharacteristic)
        
        
        store.requestAuthorization(toShare: nil, read: dataTypesToRead as! Set<HKObjectType>) { success, error in
            if success {
                debugPrint("Authorization permitted")
            }else{
                debugPrint("Authorization not permitted")
            }
        }
    }
}
