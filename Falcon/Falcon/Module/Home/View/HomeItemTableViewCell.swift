//
//  HomeItemTableViewCell.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then

class HomeItemTableViewCell: FalcTableViewCell<HomeItemTableViewCellModel> {
    
    private var bakView: UIView = {
        var view = UIView()
        return view
    }()
    
    private var titleLabel: UILabel = {
        var label = UILabel().then {
            $0.textColor = UIColor.sgBlackColor
            $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
        return label
    }()
    
    private var descLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.sgDarkGrayColor
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    lazy private var tagButton: UIButton = {
        var button = UIButton(type: .custom)
        button.backgroundColor = UIColor.sgMainTintColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets.left = 6
        button.contentEdgeInsets.right = 6
        button.layer.cornerRadius = 2
        return button
    }()
    
    private var timeLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.sgLightGrayColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private var lineView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.sgBackgroundColor
        return view
    }()
    
    override func initialViews() {
        super.initialViews()
        addSubview(bakView)
        [titleLabel, descLabel, tagButton, timeLabel, lineView].forEach {
            bakView.addSubview($0)
        }
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        bakView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        tagButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(10)
            make.leading.equalTo(descLabel)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(21)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(tagButton)
            make.trailing.equalTo(titleLabel)
        }
        
        lineView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.titleText
        descLabel.text = viewModel.descText
        tagButton.setTitle(viewModel.authorText.uppercased(), for: .normal)
        timeLabel.text = viewModel.timeText
    }
}


class HomeItemTableViewCellModel: FalcViewModel<NSObject> {
    public var titleText: String = ""
    public var descText: String = ""
    public var tagText: String = ""
    public var authorText: String = ""
    public var timeText: String = ""
    public var articleUrlString: String = ""
}
