//
//  TalkProgressViewModel.swift
//  Falcon
//
//  Created by Rickey on 2019/9/16.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

class TalkProgressViewModel: FalcViewModel<NSObject> {
    
    public var duration: TimeInterval = 0
    public var curTime: TimeInterval = 0
    public var isPlaying = false
    public var title = ""
    
}
