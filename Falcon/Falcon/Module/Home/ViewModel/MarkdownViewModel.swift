//
//  MarkdownViewModel.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/20.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

class MarkdownViewModel: FalcViewModel<NSObject> {
    
    public var markdown: String?
    /// 是否在 Markdown 里显示图片，默认展示
    public var isShowImage = true
    /// 图片是否可点击，默认不可以点击。如果图片可点击，请实现 MarkdownViewDelegate 中的 onTouchImage 方法
    public var canTouchImage = false
    
}
