//
//  TalkBottomProgressView.swift
//  Falcon
//
//  Created by Rickey on 2019/9/16.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class TalkBottomProgressView: FalcView<TalkProgressViewModel> {
    
    static let ProgressViewHeight: CGFloat = 60
    
    private let progressView = UIProgressView(progressViewStyle: .default).then {
        $0.progressTintColor = .sgMainTintColor
        $0.trackTintColor = UIColor(red: 232 / 255.0, green: 232 / 255.0, blue: 232 / 255.0, alpha: 1.0)
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = UIColor.falcDarkGrayColor
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private let timeLabel = UILabel().then {
        $0.textColor = UIColor.falcLightGrayColor
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private let playButton = UIButton().then {
        $0.setImage(#imageLiteral(resourceName: "iconPodcastPlay") , for: .normal)
    }
    
    override func initialViews() {
        super.initialViews()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.frame = bounds
        [blurEffectView, progressView, titleLabel, timeLabel, playButton].forEach {
            addSubview($0)
        }
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        progressView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(3)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-55)
            make.height.equalTo(17)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(14)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(15)
            make.right.equalTo(-15)
            make.height.width.equalTo(25)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        timeLabel.text = "\(viewModel.curTime) / \(viewModel.duration)"
        progressView.setProgress(0.5, animated: false)
    }
    
}
