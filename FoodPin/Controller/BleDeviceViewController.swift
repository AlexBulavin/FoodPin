//
//  BleDeviceViewController.swift
//  FoodPin
//
//  Created by Alex on 30.10.2020.
//  Copyright © 2020 Alex. All rights reserved. CoreBluetooth Marcus Isaksson
//  Device BLE name - 01136B (my home kitchen scale)

import UIKit
import CoreBluetooth

class BleDeviceViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
      
    var centralManager: CBCentralManager!
    var scale: CBPeripheral?
    
    let serviceUUID = CBUUID(string: "780A") //ID сервиса 780А
    let kitchenScaleCharacteristicUUID = CBUUID(string: "8AA2")//Unknown characterristic 
    //UUID: 8AA2
    //Properties: Notify
    //Value 0x0C-0D-00-00-81-10-17-00 где 0D-00 - это вес
    
    @IBOutlet weak var weightLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - BLE controller initiating
        centralManager = CBCentralManager()
        centralManager.delegate = self
    }

    // MARK: - Central manager delegate
    func  centralManagerDidUpdateState(_ central: CBCentralManager)  {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        }
    }

    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementDate: [String : Any], rssi RSSI: NSNumber) {
        centralManager.stopScan()
        scale = peripheral
        centralManager.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
    }
    // MARK: - Peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices eror: Error?) {
        if let service = peripheral.services?.first(where: { $0.uuid == serviceUUID
        }) {
            peripheral.discoverCharacteristics([kitchenScaleCharacteristicUUID], for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDisccoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristic = service.characteristics?.first(where: { $0.uuid == kitchenScaleCharacteristicUUID}) {
            peripheral.setNotifyValue(true, for: characteristic) //true означает, что если девайс опубликует (отправит) данные, приложение будет их слушать и принимать.
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?)  {
        //Всякий раз при получении новых данных от девайса вызывается этот метод (функция).
        if let data = characteristic.value {
            let weight: UInt8 = data.withUnsafeBytes { $0.pointee } //В data приходит сразу много данных для более эффективного использования канала передачи данных. Например, первые 8 бит согласно спецификации - это Flag - выбор типа данных (граммы, унции, фунты и т.д.). Далее идут данные веса в гр в uint24, если Flag = 00. Далее данные веса в LB в uint8, если Flag = 01, далее данные веса в OZ в SFLOAT, если Flag = 10 (наверное),
            weightLabel.text = String(weight) + " гр."
        }
    }
}
