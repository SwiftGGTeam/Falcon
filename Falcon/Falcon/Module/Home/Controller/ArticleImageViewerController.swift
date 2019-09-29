//
//  ArticleImageViewerController.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/21.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleImageViewerController: UIViewController {
    
    public var imageUrl: URL? = nil
    public var image: UIImage? = nil
    
    private var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.sgMainTintColor
        progressView.trackTintColor = UIColor.sgLightGrayColor
        return progressView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = { [unowned self] in
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        [imageView, progressView].forEach {
            scrollView.addSubview($0)
        }
        
        imageView.frame = view.bounds
        scrollView.frame = view.bounds
        progressView.frame = CGRect(x: 0, y: 0,
                                    width: view.bounds.width,
                                    height: 2)
        scrollView.contentSize = imageView.bounds.size
        setupGesture()
        
        edgesForExtendedLayout = UIRectEdge()
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageView()
    }
    
    // MARK: Setups
    
    fileprivate func setupGesture() {
        let double = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        double.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(double)
    }
    
    fileprivate func setupImageView() {
        guard image == nil else { return }
        progressView.progress = 0
        let manager = SDWebImageManager.shared
        manager.loadImage(with: imageUrl,
                          options: [],
                          progress: { [unowned self] (receivedSize, expectedSize, url) in
                            let progress = Float(receivedSize) / Float(expectedSize)
                            DispatchQueue.main.async {
                                self.progressView.progress = progress
                                self.progressView.setProgress(progress, animated: true)
                            }
        }) { [unowned self] (image, data, error, cacheType, finished, url) in
            if finished {
                DispatchQueue.main.async {
                    self.progressView.isHidden = true
                    self.image = image
                    self.imageView.image = image
                    if let scale = self.calculateMaximumZoomScale(self.scrollView.bounds.size) {
                        self.scrollView.maximumZoomScale = scale
                        print("  scrollView.maximumZoomScale: \(scale)")
                    }
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func calculateMaximumZoomScale(_ size: CGSize) -> CGFloat? {
        guard let image = self.image else { return nil }
        return max(2, max(
            image.size.width  / size.width,
            image.size.height / size.height
        ))
    }
    
    // MARK: Gesture
    
    @objc fileprivate func doubleTap(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: scrollView)
        
        if scrollView.zoomScale == 1.0 {
            
            scrollView.zoom(to: CGRect(x: point.x-40, y: point.y-40, width: 80, height: 80), animated: true)
        } else {
            scrollView.setZoomScale(1.0, animated: true)
        }
    }
    
}

extension ArticleImageViewerController: UIScrollViewDelegate {
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        imageView.frame = CGRect(origin: .zero, size: scrollView.contentSize)
    }
    
}
