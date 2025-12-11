//
//  TimeOption.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 9.12.2025.
//

import SwiftUI
import Foundation

enum TimeOption: CaseIterable {
    case unlimited, thirtyMin, oneHour, threeHours, fiveHours
    
    var label: String {
        switch self {
        case .unlimited: return "Unlimited"
        case .thirtyMin: return "30 min"
        case .oneHour: return "1 h"
        case .threeHours: return "3 h"
        case .fiveHours: return "5 h"
        }
    }
    
    var textXOffset: CGFloat {
        switch self {
        case .unlimited: return -53
        case .thirtyMin: return -37
        case .oneHour: return -20
        case .threeHours: return -20
        case .fiveHours: return -20
        }
    }
    
    var seconds: TimeInterval? {
        switch self {
        case .unlimited: return nil
        case .thirtyMin: return 30 * 60
        case .oneHour: return 60 * 60
        case .threeHours: return 3 * 60 * 60
        case .fiveHours: return 5 * 60 * 60
        }
    }
}
