//
//  HomeViewModel.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class HomeViewModel: FalcViewModel<ViewModel> {
    
    override func initialDatas() {
        super.initialDatas()
        let fakeDatas = initFakeDatas()
        fakeDatas.forEach {
            datas.append($0)
        }
    }
    
    func initFakeDatas() -> [HomeItemTableViewCellModel] {
        
        let m1 = HomeItemTableViewCellModel()
        m1.titleText = "在 iOS 11 中使用 Core Bluetooth"
        m1.descText = "现在地球上有数十亿的无线通讯设备。在这篇教程中，我们将聚焦 IoT 其中的一部分：蓝牙。"
        m1.authorText = "APP CODA"
        m1.timeText = "2019.04.15"
        m1.articleUrlString = "https://swift.gg/2019/04/15/core-bluetooth/"
        
        let m2 = HomeItemTableViewCellModel()
        m2.titleText = "Void"
        m2.descText = "从我们第一篇关于 Objective-C 中的 nil 的文章到最近对 Swift 中 Never 类型的一瞥，“不存在”一直是 NSHipster 讨论的话题。但今天的文章可能是它们当中充斥着最多如恐怖留白般细节的——因为我们将目光聚焦在了 Swift 中的 Void 上。"
        m2.authorText = "NSHipster"
        m2.timeText = "2019.02.25"
        m2.articleUrlString = "https://swift.gg/2019/02/25/void/"
        
        let m3 = HomeItemTableViewCellModel()
        m3.titleText = "Swift 5 字符串插值之美"
        m3.descText = "感谢提案 SE-0228，让我们能够精确控制字符串插值的打印方式。感谢 Brent 带给我们这个非常棒的功能。让我来分享一些例子。"
        m3.authorText = "Erica Sadun"
        m3.timeText = "2019.02.21"
        m3.articleUrlString = "https://swift.gg/2019/02/21/the-beauty-of-swift-5-string-interpolation/"
        
        let m4 = HomeItemTableViewCellModel()
        m4.titleText = "Swift 中的集合（Set）"
        m4.descText = "集合（Set）是 Swift 集合类型（collection types）之一，集合用来存储类型相同且没有确定顺序唯一的值。你可以将集合想象成一盒台球：它们在颜色和数量上独一无二，但在盒内是无序的。"
        m4.authorText = "Thomas Hanning"
        m4.timeText = "2019.07.09"
        m4.articleUrlString = "https://swift.gg/2019/07/09/Sets-in-Swift/"
        
        let m5 = HomeItemTableViewCellModel()
        m5.titleText = "Bundles and Packages"
        m5.descText = "在这个给予的季节，让我们停下脚步，思考一个现代计算机系统赐予我们的最棒的礼物：抽象。在数百万 CPU 晶体管、SSD 扇区和 LCD 像素共同协作下，全球数十亿人能够日常使用计算机和移动设备而对此全然不知。这一切都应归功于像文件，目录，应用和文档这样的抽象。这周的 NSHipster，我们将讨论苹果平台上两个重要的抽象：包与包裹。🎁"
        m5.authorText = "Mattt"
        m5.timeText = "2019.07.19"
        m5.articleUrlString = "https://swift.gg/2019/07/19/nshipster-bundles-and-packages/"
        
        let m6 = HomeItemTableViewCellModel()
        m6.titleText = "Swift 中的面向协议编程：是否优于面向对象编程？"
        m6.descText = "在本文中，我们将深入讨论 Swift 4 中的面向协议编程。这是一个系列两篇文章中的第二篇。如果你还没有读过 前一篇介绍文章，请在继续阅读本文之前先阅读前一篇。"
        m6.authorText = "app coda"
        m6.timeText = "2018.12.03"
        m6.articleUrlString = "https://swift.gg/2018/12/03/pop-vs-oop/"
        
        let m7 = HomeItemTableViewCellModel()
        m7.titleText = "让我们构建一个Swift.Array"
        m7.descText = "Swift 1.2 现已经作为 Xcode 6.3 的一部分而发布，在新的 API 中有一个允许我们使用值类型建立高效的数据结构，比如 Swift 标准库中的 Array 类型。今天，我们将重新现实 Array 的核心功能。"
        m7.authorText = "Mike Ash"
        m7.timeText = "2018.12.06"
        m7.articleUrlString = "https://swift.gg/2018/12/06/friday-qa-2015-04-17-lets-build-swiftarray/"
        
        let m8 = HomeItemTableViewCellModel()
        m8.titleText = "实用的可选项（Optional）扩展"
        m8.descText = "可选值（Optional）是 Swift 语言最基础的内容。我想每个人都同意它带来了巨大的福音，因为它迫使开发者妥善处理边缘情况。可选值的语言特性能让发者在开发阶段发现并处理整个类别的 bug。"
        m8.authorText = "APPVENTURE"
        m8.timeText = "2018.11.19"
        m8.articleUrlString = "https://swift.gg/2018/11/19/useful-optional-extensions/"
        
        return [m1, m2, m5, m3, m4, m6, m7, m8]
    }
}
