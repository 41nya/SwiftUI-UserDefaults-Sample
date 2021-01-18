//
//  ListData.swift
//  SwiftUI-UserDefaults-Sample
//
//  Created by 41nya on 2021/01/18.
//

import Foundation

final class ListData : ObservableObject {
    @Published var lists : [Data] = []
    private let key = "SwiftUI-UserDefaults-Sample"
    
    init() {
        let data = UserDefaults.standard.data(forKey: key)

        if nil != data {
            guard let lists = try? JSONDecoder().decode([Data].self, from: data.unsafelyUnwrapped) else {
                fatalError()
            }
            
            self.lists = lists
        }
    }
    
    func add(input : String) -> Bool {
        for data in lists {
            if data.value == input {
                return false
            }
        }
        
        let data = Data(id:UUID(), value: input)
        lists.append(data)
        
        save()
        return true
    }
    
    func remove(atOffsets offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
        save()
    }
    
    private func save() {
        guard let data = try? JSONEncoder().encode(lists) else {
            fatalError()
        }
        UserDefaults.standard.set(data, forKey: key)
    }
}
