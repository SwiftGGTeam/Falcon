//
//  AppConfigurator.swift
//  Falcon
//
//  Created by Roc Zhang on 2019/11/6.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation
import Then

protocol FalconAppConfigurator {
    
    func onAppFinishLaunching()
    
}

struct FalconAppConfiguratorCenter {
    
    static private var configurators: [FalconAppConfigurator] = []
    
    static func register(_ configurators: FalconAppConfigurator...) {
        self.configurators.append(contentsOf: configurators)
    }
    
    static func appFinishedLaunching() {
        configurators.forEach { $0.onAppFinishLaunching() }
    }
    
}
