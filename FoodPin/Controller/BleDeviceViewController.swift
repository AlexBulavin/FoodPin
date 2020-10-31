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
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: centralManager)) \n")
    }

    // MARK: - Central manager delegate
    func  centralManagerDidUpdateState(_ central: CBCentralManager)  {
        if central.state == .poweredOn { //Проверяем, включен ли Bluetooth на телефоне. Если не выключен, то выводится системное сообщение о необходимости его включить.
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
            print("Power is ON \n \(#file) Функция \(#function ) строка \(#line)")
            print("centralManager \(String(describing: centralManager)) \n")
            
        }
    }

    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("\nName   : \(peripheral.name ?? "(No name)")")
        print("RSSI   : \(RSSI)")
            for ad in advertisementData {
                print("AD Data: \(ad)\n\n")
            }
        centralManager.stopScan()
        scale = peripheral
        centralManager.connect(peripheral, options: nil)
        let CBAdvertisementDataManufacturerDataKey: String // The manufacturer data of a peripheral.
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("CBAdvertisementDataManufacturerDataKey \(advertisementData) \n")
        let CBAdvertisementDataServiceDataKey: String //A dictionary that contains service-specific advertisement data.
        let CBAdvertisementDataServiceUUIDsKey: String //An array of service UUIDs.
        let CBAdvertisementDataOverflowServiceUUIDsKey: String //An array of UUIDs found in the overflow area of the advertisement data.
        let CBAdvertisementDataTxPowerLevelKey: String //The transmit power of a peripheral.
        let CBAdvertisementDataIsConnectable: String //A Boolean value that indicates whether the advertising event type is connectable.
        let CBAdvertisementDataSolicitedServiceUUIDsKey: String //An array of solicited service UUIDs.
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: centralManager)) \n scale =  \(scale)")
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: peripheral)) \n")
    }
    // MARK: - Peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices eror: Error?) {
        if let service = peripheral.services?.first(where: { $0.uuid == serviceUUID
        }) {
            peripheral.discoverCharacteristics([kitchenScaleCharacteristicUUID], for: service)
            print("\(#file) Функция \(#function ) строка \(#line)")
            print("peripheral \(String(describing: peripheral)) \n")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
            print("\(#file) Функция \(#function ) строка \(#line)")
            
        if let characteristic = service.characteristics?.first(where: { $0.uuid == kitchenScaleCharacteristicUUID}) {
            peripheral.setNotifyValue(true, for: characteristic) //true означает, что если девайс опубликует (отправит) данные, приложение будет их слушать и принимать.
            print("\(#file) Функция \(#function ) строка \(#line)")
            print("peripheral \(String(describing: peripheral)) \n")
        }
      
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?)  {
        //Всякий раз при получении новых данных от девайса вызывается этот метод (функция).
        if let data = characteristic.value {
            let weight = data.withUnsafeBytes { $0.load(as: Int.self) }  >> 8 & 0xFFFFFF  //В data приходит сразу много данных для более эффективного использования канала передачи данных. Например, первые 8 бит согласно спецификации - это Flag - выбор типа данных (граммы, унции, фунты и т.д.). Далее идут данные веса в гр в uint24, если Flag = 00. Далее данные веса в LB в uint8, если Flag = 01, далее данные веса в OZ в SFLOAT, если Flag = 10 (наверное) и так далее.
            //Мы можем сделать операцию Shift 8 бит в начале (Flags) и далее, закончив его на 0xFFFFFF (что есть 16ричное представление первых 24 бит). Мы должны поставить маску на ту часть, которая нас интересует. И оставить остальные биты = 0.
            weightLabel.text = String(weight) + " гр."
            print("\(#file) Функция \(#function ) строка \(#line)")
            print("peripheral \(String(describing: weightLabel.text)) \n")
        }
    }
}
