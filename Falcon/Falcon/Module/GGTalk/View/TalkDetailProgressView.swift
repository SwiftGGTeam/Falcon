//
//  TalkDetailProgressView.swift
//  Falcon
//
//  Created by Rickey on 2019/10/17.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class TalkDetailProgressView: FalcView<TalkItemViewModel> {
    
    private let pullDownView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "iconPullDownButton")
    }
    
    private let titleImage = UIImageView()
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    private let timeLabel = UILabel().then {
        $0.textColor = UIColor.falcLightGrayColor
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private let playButton = UIButton().then {
        $0.setImage(#imageLiteral(resourceName: "iconPodcastPlay") , for: .normal)
    }
    
    private let progressView = UIProgressView(progressViewStyle: .default).then {
        $0.progressTintColor = .sgMainTintColor
        $0.trackTintColor = UIColor(red: 232 / 255.0, green: 232 / 255.0, blue: 232 / 255.0, alpha: 1.0)
    }
    
    override func initialViews() {
        super.initialViews()
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        [pullDownView, titleImage, titleLabel, timeLabel, playButton, progressView].forEach {
            addSubview($0)
        }
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        pullDownView.snp.makeConstraints { (make) in
            make.centerX.top.equalToSuperview()
            make.height.width.equalTo(30)
        }
        titleImage.snp.makeConstraints { make in
            make.top.equalTo(pullDownView.snp.bottom).offset(15)
            make.left.equalTo(18)
            make.height.width.equalTo(75)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.top).offset(24)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.right.equalTo(-18)
            make.height.equalTo(46)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(29)
            make.left.equalTo(18)
            make.right.equalTo(-66)
            make.height.equalTo(14)
        }
        playButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.right.equalTo(-18)
            make.bottom.equalTo(-21)
        }
        progressView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(5)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let vm = viewModel else { return }
        titleLabel.text = vm.title
        timeLabel.text = "\(vm.duration) / \(vm.duration)"
        if let imageUrl = URL(string: vm.image) {
            titleImage.sd_setImage(with: imageUrl, completed: nil)
        }
        progressView.setProgress(0.5, animated: false)
        updateLayouts()
        layoutIfNeeded()
    }
    
}
