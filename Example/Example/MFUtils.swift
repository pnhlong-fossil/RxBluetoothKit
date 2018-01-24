//
//  MFUtils.swift
//  RxBluetoothKitExample
//
//  Created by Long Pham on 1/24/18.
//  Copyright © 2018 Polidea. All rights reserved.
//

import Foundation
import RxBluetoothKit
//import RxSwift
import CoreBluetooth

class MFUtils{
    static func parseDeviceSerial(peripheral: ScannedPeripheral) -> String?{
        var serialNumber: String? = nil
        let manufacturerData = peripheral.advertisementData.manufacturerData
        if manufacturerData != nil && manufacturerData!.count >= 12 {
            serialNumber = String(data: manufacturerData!.advanced(by: 2), encoding: .utf8)
        }
        return serialNumber
    }
    
    
    static func isMisfitDevice(peripheral: ScannedPeripheral) -> Bool {
        //Check if is Misfit device
        guard let services = peripheral.advertisementData.serviceUUIDs else{
            return false
        }
        
        if !services.contains(CBUUID(string: "3dda0001-957f-7d4a-34a6-74696673696d")){
            return false
        }
        return true
    }
}

