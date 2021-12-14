//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Amr Hossam on 14/12/2021.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
