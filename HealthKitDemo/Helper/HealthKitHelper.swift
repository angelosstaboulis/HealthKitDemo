//
//  HealthKitHelper.swift
//  HealthKitDemo
//
//  Created by Angelos Staboulis on 29/1/24.
//

import Foundation
import HealthKit
class HealthKitHelper{
    let store = HKHealthStore()
    static let shared = HealthKitHelper()
    private init(){}
    func getDateOfBirth()->String{
        var dateOfBirth: String?{
            if let dateOfBirth = try? store.dateOfBirth(){
                let dateFormater = DateFormatter()
                dateFormater.dateStyle = .short
                return dateFormater.string(from: dateOfBirth)
            }
            return nil
        }
        return dateOfBirth!
    }
    func getBiologicalSex()->String{
        var biologicalSex: String? {
            if let biologicalSex =  try? store.biologicalSex(){
                switch biologicalSex.biologicalSex {
                case .female:
                    return "Female"
                case .male:
                    return "Male"
                case .notSet:
                    return nil
                default:
                    return nil
                }
            }
            return nil
        }
        return biologicalSex!
    }
    func getWheelChair()->String{
        var wheelChair:String?{
            if let wheelChair = try? store.wheelchairUse(){
                switch wheelChair.wheelchairUse {
                case .notSet:
                    return nil
                case .no:
                    return "No"
                case .yes:
                    return "Yes"
                @unknown default:
                    fatalError()
                }
            }
            return nil
        }
        return wheelChair ?? "No"
    }
    func getBloodType()->String{
        var bloodType: String? {
            if let bloodType = try? store.bloodType(){
                switch bloodType.bloodType {
                case .aPositive:
                    return "A+"
                case .aNegative:
                    return "A-"
                case .bPositive:
                    return "B+"
                case .bNegative:
                    return "B-"
                case .abPositive:
                    return "AB+"
                case .abNegative:
                    return "AB-"
                case .oPositive:
                    return "O+"
                case .oNegative:
                    return "O-"
                case .notSet:
                    return nil
                @unknown default:
                    fatalError()
                }
            }
            return nil
        }
        return bloodType!
    }
}
