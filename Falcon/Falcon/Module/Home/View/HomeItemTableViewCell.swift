//
//  HomeItemTableViewCell.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit

class HomeItemTableViewCell: FalcTableViewCell<HomeItemTableViewCellModel> {
    
    private let bakView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.falcBlackColor
        label.numberOfLines = 0
        label.font = .sgHeadline
        return label
    }()
    
    private let descView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.falcDarkGrayColor
        label.font = .sgSubhead
        return label
    }()
    
    private let descImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 5
        return imageView
    }()
    
    private let tagButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .sgMainTintColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .sgCaption1
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets.left = 6
        button.contentEdgeInsets.right = 6
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        button.layer.cornerRadius = 2
        button.isEnabled = false
        return button
    }()
    
    private let timeLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .falcLightGrayColor
        label.font = .sgFootnote
        return label
    }()
    
    private let lineView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.falcLineColor
        return view
    }()
    
    override func initialViews() {
        super.initialViews()
        [descLabel, descImageView].forEach {
            descView.addArrangedSubview($0)
        }
        addSubview(bakView)
        [titleLabel, descView, tagButton, timeLabel, lineView].forEach {
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
        
        descView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descImageView.snp.makeConstraints { make in
            make.width.height.equalTo(75)
        }
        
        tagButton.snp.makeConstraints { make in
            make.top.equalTo(descView.snp.bottom).offset(15)
            make.leading.equalTo(descView)
            make.bottom.equalToSuperview().offset(-20)
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
        guard let viewModel = viewModel,
            let article = viewModel.data else { return }
        titleLabel.text = article.title
        if let preface = article.preface {
            var briefPreface = ""
            if preface.count > 140 {
                briefPreface = preface[safe: 0..<140] ?? ""
            } else {
                briefPreface = preface
            }
            descLabel.attributedText = NSAttributedString(string: briefPreface, attributes: [.paragraphStyle: NSParagraphStyle.falDescriptionParagraphStyle])
        }
        
        tagButton.setTitle(article.category?.uppercased(), for: .normal)
        if var dateString = article.publishDate {
            if dateString.contains("-") {
                dateString = dateString.replacingOccurrences(of: "-", with: ".")
            }
            timeLabel.text = dateString
        }
        if let imageURL = article.imageURL,
            imageURL != "" {
            descView.addArrangedSubview(descImageView)
            descImageView.isHidden = false
            let url = URL(string: imageURL)
            descImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            descView.removeArrangedSubview(descImageView)
            descImageView.isHidden = true
        }
    }
    
}


class HomeItemTableViewCellModel: FalcViewModel<ArticleModel> {
    var imageLink: String?
}
