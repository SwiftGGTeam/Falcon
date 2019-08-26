//
//  EventCollectionViewCell.swift
//  Falcon
//
//  Created by Q on 2019/8/20.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

/// 活动 cell
class EventItemCollectionViewCell: FalcCollectionViewCell<EventItemCollectionViewCellModel> {
    private var bakView: UIView = {
        var view = UIView()
        return view
    }()
    
    private var backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "互联网寒冬来袭 \n 移动开发者如何破局"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private var statusLabel: UILabel = {
        var label = UILabel()
        label.text = "开放报名中"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.cornerRadius = 2
        label.font = UIFont.systemFont(ofSize: 10.0, weight: .semibold)
        label.backgroundColor = UIColor.sgMainTintColor
        return label
    }()
    
    private var locationLabel: UILabel = {
        var label = UILabel()
        label.text = "上海虹口区上海市天水路172号金融街海伦中心B座"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .semibold)
        return label
    }()

    private var timeLabel: UILabel = {
        var label = UILabel()
        label.text = "2019-04-20  13:00 ~ 18:00"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        return label
    }()

    override func initialViews() {
        super.initialViews()
        addSubview(bakView)
        bakView.addSubview(backgroundImage)
        bakView.addSubview(statusLabel)
        bakView.addSubview(titleLabel)
        bakView.addSubview(locationLabel)
        bakView.addSubview(timeLabel)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        bakView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        statusLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(62)
            make.height.equalTo(21)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(statusLabel)
            make.top.equalTo(statusLabel.snp.bottom).offset(9)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationLabel)
            make.top.equalTo(locationLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-25)
            make.height.equalTo(17)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel else { return }
        backgroundImage.sd_setImage(with: URL(string: viewModel.backgroundImage), placeholderImage: nil, options: .retryFailed, completed: nil)
        titleLabel.text = viewModel.titleText
        statusLabel.text = viewModel.statusText
        locationLabel.text = viewModel.locationText
        timeLabel.text = viewModel.timeText
    }
}

class EventItemCollectionViewCellModel: FalcViewModel<NSObject> {
    public var backgroundImage: String = ""
    public var titleText: String = ""
    public var statusText: String = ""
    public var locationText: String = ""
    public var timeText: String = ""

}
