# Falcon

Falcon heavy rocket🚀. An iOS application for SwiftGG.

## Introduction

The Falcon is written by Swift language, and follows the MVVM architecture.

### `FalcView` & `FalcTableViewCell` & `FalcViewController`

To descripe a View in application. It needs to bind a `ViewModel` to show the datas.

```swift
class HomeItemTableViewCell: FalcTableViewCell<HomeItemTableViewCellModel> {
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
class HomeItemTableViewCellModel: FalcViewModel<Article> {}
```

In the demo, the `Article` is to descripe a basic meta model.

### `UITableView` specification

Because of holding a group of ViewModels, the ViewController can call all datas for ViewController's View. If we make a all _CellMLodels_ in the controller's ViewModel, the delegate function in `UITableView` is able to be code below:

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let vm = viewModel?.datas[safe: indexPath.row]
    if let vm = vm as? HomeItemTableViewCellModel {
        let cell = tableView.dequeueReusableCell(withClass: HomeItemTableViewCell.self)
        cell.selectionStyle = .none
        cell.viewModel = vm // update the datas and call updateViews
        return cell
    }
    else if let vm = vm as? XXXXCellModel {
        ....
    }
    return UITableViewCell()
}
```

## Deploy The Development Environment

```bash
$ git clone git@github.com:SwiftGGTeam/Falcon.git && cd Falcon
$ bundle install
$ cd Falcon
$ bundle exec pod install --repo-update
```

## UI

🖼 [zeplin](https://zpl.io/aNmPNrD)

## Product Docs

📃 [Product Design](https://docs.google.com/document/d/1Y23SVmnmJXFGIoFXcHexPHXg_r4jENkET60bpcAwo20/edit?usp=sharing)

## License
