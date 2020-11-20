//
//  MeasurementTable.swift
//  FoodPin
//
//  Created by Alex on 04.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

//import Foundation
class MeasurementTable {
    var measurement = ["г", "Кг", "мл", "л", "ч.л.", "ст.л.", "десерт.л.", "лист", "шт", "упак", "табл", "зерн", "пачк", "бутылка", "пакет", "горсть", "по вкусу", "щепотка", "лопатка", "долька", "зубчик" ]
    
    init (measurementID: [String]) {
        self.measurement = measurementID
    }
    
    convenience init() {
        self.init(measurementID: [""])
    }
}


