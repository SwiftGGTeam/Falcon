//
//  TalkItemCell.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then

class TalkItemCell: FalcTableViewCell<TalkItemViewModel> {
    
    private let backView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.textColor = UIColor.sgBlackColor
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    private let descLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = UIColor.sgDarkGrayColor
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    
    private let playButton = UIButton().then {
        $0.setImage(#imageLiteral(resourceName: "iconPodcastPlay") , for: .normal)
    }
    
    private let durationLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = UIColor.sgLightGrayColor
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private let timeLabel = UILabel().then {
        $0.textAlignment = .right
        $0.textColor = UIColor.sgLightGrayColor
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = UIColor.sgBackgroundColor
    }
    
    override func initialViews() {
        super.initialViews()
        addSubview(backView)
        [titleLabel, descLabel, playButton, durationLabel, timeLabel, lineView].forEach {
            backView.addSubview($0)
        }
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(27)
        }
        descLabel.snp.makeConstraints { make in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(10)
            make.left.equalTo(descLabel)
            make.height.width.equalTo(25)
            make.bottom.equalTo(-22)
        }
        durationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.left.equalTo(playButton.snp.right).offset(7)
            make.width.equalTo(100)
        }
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.right.equalTo(-16)
            make.left.equalTo(durationLabel.snp.right)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        descLabel.text = viewModel.desc
        timeLabel.text = viewModel.pubDate
        durationLabel.text = viewModel.duration
    }
}
