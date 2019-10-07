//
//  ShopItemTableViewCell.swift
//  Falcon
//
//  Created by Q on 2019/7/27.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SwifterSwift
import Then
import SDWebImage

/// 商店列表商品 Cell
class ShopItemTableViewCell: FalcTableViewCell<ShopItemTableViewCellModel> {

    private var bakView: UIView = {
        var view = UIView()
        return view
    }()
    
    private var goodsImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 5
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "GGTalk 字幕合集书"
        label.textColor = UIColor.greyishBrown
        label.font = UIFont.falcFont(size: 16, thick: .semibold)
        return label
    }()
    
    private var descLabel: UILabel = {
        var label = UILabel()
        label.text = "包含 110 期节目的所有字幕合集，附赠 MM 手绘小鸡贴纸 2 张。还是麻辣味道。"
        label.numberOfLines = 0
        label.textColor = UIColor.sgDarkGrayColor
        label.font = UIFont.falcFont(size: 13, thick: .medium)
        return label
    }()
    
    private var priceLabel: UILabel = {
        var label = UILabel()
        label.text = "¥ 139"
        label.textColor = UIColor.white
        label.font = UIFont.falcFont(size: 12, thick: .medium)
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
        bakView.addSubview(goodsImage)
        bakView.addSubview(titleLabel)
        bakView.addSubview(descLabel)
        bakView.addSubview(priceLabel)
        bakView.addSubview(lineView)
    }

    override func initialLayouts() {
        super.initialLayouts()
        
        bakView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        goodsImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(27)
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(goodsImage.snp.trailing).offset(22)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-46)
        }
        
        lineView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel else { return }
        goodsImage.sd_setImage(with: URL(string: viewModel.goodsImage), placeholderImage: nil, options: .retryFailed, completed: nil)
        titleLabel.text = viewModel.titleText
        descLabel.text = viewModel.descText
        priceLabel.text = viewModel.priceText
    }
}

class ShopItemTableViewCellModel: FalcViewModel<NSObject>, Mappable {
    public var id: Int = 0
    public var goodsImage: String = ""
    public var titleText: String = ""
    public var descText: String = ""
    public var priceText: String = ""
    public var price: Int = 0 {
        didSet {
            priceText = "￥ \(price)"
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        backgroundImage <- map["imageURL"]
        titleText <- map["name"]
        descText <- map["preface"]
        price <- map["price"]
    }
    
}
