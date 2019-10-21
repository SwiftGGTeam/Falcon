//
//  TalkProgressViewModel.swift
//  Falcon
//
//  Created by Rickey on 2019/9/16.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

class TalkProgressViewModel: FalcViewModel<NSObject> {
    
    convenience init(with talkItem: TalkItemViewModel) {
        self.init()
        // TODO: - 统一 TalkProgressViewModel 属性，完善 init
        title = talkItem.title
    }
    
    public var duration: TimeInterval = 0
    public var curTime: TimeInterval = 0
    public var isPlaying = false
    public var title = ""
    
}
