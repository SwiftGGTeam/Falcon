# Falcon

Falcon heavy rocket🚀. An iOS application for SwiftGG.

## Introduction

The Falcon is written by Swift language, and follows the MVVM architecture. 

### `FalcView` & `FalcCell`

To descripe a View in application. It needs to bind a `ViewModel` to show the datas. 

```swift
class HomeItemTableViewCell: FalcCell<HomeItemTableViewCellModel> {
  override func initialViews() {}
  override func updateViews() {}
  override func initialLayouts() {}
  override func updateLayouts() {}
}
```

If we make the `cell.viewModel = xxx`, the `View` will call `updateViews` and `updateLayouts` to refresh the `View`.

### `ViewModel`

We are able to need a View Model to create a view or cell, so the `ViewModel` class can help you. It includes a group of datas to descripe all datas for a `View` or `Controller`. And the `View` can only bind the `ViewModel`.

```swift
class HomeItemTableViewCellModel: FalcModel<Article> {}
```

In the demo, the `Article` is to descripe a basic meta model.

## UI

🖼 [zeplin](https://zpl.io/aNmPNrD)

## Product Docs

📃 [Product Design](https://docs.google.com/document/d/1Y23SVmnmJXFGIoFXcHexPHXg_r4jENkET60bpcAwo20/edit?usp=sharing)

## License

