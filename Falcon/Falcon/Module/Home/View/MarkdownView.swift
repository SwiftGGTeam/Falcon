//
//  MarkdownView.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/8/1.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import WebKit

protocol MarkdownViewDelegate: NSObjectProtocol {
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat)
    func onTouchLink(_ markdownView: MarkdownView, request: URLRequest) -> Bool
    func onTouchImage(_ markdownView: MarkdownView, url: URL) -> Bool
}

extension MarkdownViewDelegate {
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat) {}
    func onTouchLink(_ markdownView: MarkdownView) -> Bool { return false }
    func onTouchImage(_ markdownView: MarkdownView, url: URL) -> Bool { return false }
}

class MarkdownView: FalcView<MarkdownViewModel> {
    
    private var webView: WKWebView?
    
    weak var delegate: MarkdownViewDelegate?
    
    @objc public var isScrollEnabled: Bool = true {
        didSet {
            webView?.scrollView.isScrollEnabled = isScrollEnabled
        }
    }
    
    open override var intrinsicContentSize: CGSize {
        if let height = self.intrinsicContentHeight {
            return CGSize(width: UIView.noIntrinsicMetric, height: height)
        } else {
            return CGSize.zero
        }
    }
    
    fileprivate var intrinsicContentHeight: CGFloat? {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func updateViews() {
        super.updateViews()
        
        guard let viewModel = viewModel,
            let markdown = viewModel.markdown else { return }
        
        let bundle = Bundle(for: MarkdownView.self)
        let htmlURL: URL? = bundle.url(forResource: "index", withExtension: "html")
        guard let url = htmlURL else { return }
        
        let escapedMarkdown = self.escape(markdown: markdown) ?? ""
        let script = "window.showMarkdown('\(escapedMarkdown)', \(viewModel.isShowImage), \(viewModel.canTouchImage));"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let controller = WKUserContentController()
        controller.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = controller
        
        let webView = WKWebView(frame: self.bounds, configuration: configuration)
        webView.scrollView.isScrollEnabled = self.isScrollEnabled
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        webView.backgroundColor = self.backgroundColor
        
        self.webView = webView
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    private func escape(markdown: String) -> String? {
        return markdown.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
    }
}

extension MarkdownView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let script = "document.body.scrollHeight;"
        webView.evaluateJavaScript(script) { [weak self] result, error in
            if let _ = error { return }
            
            guard let height = result as? CGFloat else { return }
            guard let `self` = self else { return }
            self.delegate?.didFinishRendering(self, height: height)
            self.intrinsicContentHeight = height
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        switch navigationAction.navigationType {
        case .linkActivated:
            if let urlString = navigationAction.request.url?.absoluteString,
                urlString.starts(with: "img:") {
                // touch img link
                let index = urlString.index(urlString.startIndex, offsetBy: 4)
                let newUrlString = urlString.suffix(from: index)
                let newUrl = URL(string: String(newUrlString))
                if let url = newUrl,
                    let should = delegate?.onTouchImage(self, url: url),
                    should {
                    decisionHandler(.allow)
                } else {
                    decisionHandler(.cancel)
                }
            } else {
                // touch link
                if let should = delegate?.onTouchLink(self, request: navigationAction.request), should {
                    decisionHandler(.allow)
                } else {
                    decisionHandler(.cancel)
                }
            }
        default:
            decisionHandler(.allow)
        }
    }
}
