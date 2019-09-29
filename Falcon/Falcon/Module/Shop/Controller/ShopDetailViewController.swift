//
//  ShopDetailViewController.swift
//  Falcon
//
//  Created by piggy on 2019/9/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SafariServices

/// 商品详情
class ShopDetailViewController: FalcViewController<ShopDetailViewModel> {

    // 轮播图
    private var autoScrollView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy private var markdownView: MarkdownView = { [unowned self] in
        let markdownView = MarkdownView()
        markdownView.delegate = self
        return markdownView
    }()
    
    private var bottomCartView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy private var addCartButton: UIButton = {
        var button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "iconBuy"), for: .normal)
        button.cornerRadius = 27.5
        return button
    }()
    
    private var previousPriceLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(white: 0.0, alpha: 0.75)
        label.font = UIFont.textStyle2
        return label
    }()
    
    private var nowPriceLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.white
        label.font = UIFont.sgNaviTitle
        return label
    }()
    
    override func initialViews() {
        super.initialViews()
        view.addSubview(autoScrollView)
        view.addSubview(markdownView)
        view.addSubview(bottomCartView)
        bottomCartView.addSubview(addCartButton)
        bottomCartView.addSubview(previousPriceLabel)
        bottomCartView.addSubview(nowPriceLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func initialLayouts() {
        super.initialLayouts()
        
        autoScrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(autoScrollView.snp.width).multipliedBy(281.0/375.0)
        }
        markdownView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(autoScrollView.snp.bottom)
        }
        bottomCartView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(65)
        }
        
        previousPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(14)
            make.height.equalTo(18)
        }
        
        nowPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(previousPriceLabel.snp.leading)
            make.top.equalTo(previousPriceLabel.snp.bottom).offset(2)
            make.height.equalTo(18)
        }
        
        addCartButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(8)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }
    
}

extension ShopDetailViewController: MarkdownViewDelegate {
    
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat) {
        print("Markdown did finish rendering, the height is", height)
    }
    
    func onTouchLink(_ markdownView: MarkdownView, request: URLRequest) -> Bool {
        guard let url = request.url else { return false }
        //        guard let naviController = self.navigationController else { return false }
        if url.scheme == "file" {
            return false
        } else if url.scheme == "https" {
            let safariController = SFSafariViewController(url: url)
            safariController.preferredBarTintColor = UIColor.sgNaviColor
            safariController.preferredControlTintColor = UIColor.sgMainTintColor
            self.present(safariController, animated: true, completion: nil)
            //            naviController.pushViewController(safari, animated: true)
            return false
        } else {
            return false
        }
    }
    
}
