//
//  TalkListViewModel.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

class TalkListViewModel: FalcViewModel<ViewModel> {
    
    override func initialDatas() {
        super.initialDatas()
        let fakeDatas = initFakeDatas()
        fakeDatas.forEach {
            datas.append($0)
        }
    }
    
    func initFakeDatas() -> [TalkItemViewModel] {
        
        let m1 = TalkItemViewModel()
        m1.title = "向架构进发！"
        m1.desc = "对于程序员来说，“架构师”一向是一个非常神秘的职位。大家都知道架构师很厉害，但是架构师到底在做什么？架构师和技术专家有什么区别？如何成为架构师？这期就请 Casa Taloyum 来详细聊聊这些问题。"
        m1.duration = "02:17:17"
        m1.pubDate = "2019.04.16"
        
        return [m1]
    }
    
}
