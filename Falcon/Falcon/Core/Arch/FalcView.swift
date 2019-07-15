//
//  FalcView.swift
//  Falcon
//
//  Created by Harry Duan on 2019/6/26.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation
import UIKit

// View 抽象
public protocol View {
    associatedtype ViewModel: BasicViewModel
    
    var viewModel: ViewModel? { get set }
    
    func initialViews()
    func initialLayouts()
    func updateViews()
    func updateLayouts()
}

// Falc 实例
public class FalcView<T: ViewModel>: UIView, View {
    public typealias ViewModel = T
    
    public var viewModel: T? {
        didSet {
            updateViews()
            updateLayouts()
        }
    }
    
    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        if var vm = self.viewModel {
            vm.delegate = self
        }
        initialViews()
        initialLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initialViews() {}
    open func updateViews() {}
    open func initialLayouts() {}
    open func updateLayouts() {}
}

extension FalcView: BasicViewDelegate {
    open func modelChanged(_ models: [Any]) {}
}

// FalcCell 实例
public class FalcTableViewCell<T: ViewModel>: UITableViewCell, View {
    public typealias ViewModel = T
    
    public var viewModel: T? {
        didSet {
            updateViews()
            updateLayouts()
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.viewModel = nil
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialViews()
        initialLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initialViews() {}
    open func updateViews() {}
    open func initialLayouts() {}
    open func updateLayouts() {}
}


