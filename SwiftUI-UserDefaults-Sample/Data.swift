//
//  Data.swift
//  SwiftUI-UserDefaults-Sample
//
//  Created by 41nya on 2021/01/18.
//

import Foundation

struct Data : Codable, Identifiable, Hashable {
    var id : UUID
    var value : String
}
