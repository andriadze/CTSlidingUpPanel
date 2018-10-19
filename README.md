# Swift-CTSlidingUpPanel
[![Version](https://img.shields.io/cocoapods/v/CTSlidingUpPanel.svg?style=flat)](http://cocoapods.org/pods/CTSlidingUpPanel)
[![License](https://img.shields.io/cocoapods/l/CTSlidingUpPanel.svg?style=flat)](http://cocoapods.org/pods/CTSlidingUpPanel)
[![Platform](https://img.shields.io/cocoapods/p/CTSlidingUpPanel.svg?style=flat)](http://cocoapods.org/pods/CTSlidingUpPanel)


Transforms any view to sliding panel

Panel supports Anchor points, TabBarController and NavigationController, also it has basic TableView support.

<img src="https://thumbs.gfycat.com/OffbeatCaringGalago-size_restricted.gif" width="350">


# Cocoapods

### Swift 4.2
Add following to your Podfile:
```
pod "CTSlidingUpPanel"
```
### Swift 4.0
```
pod "CTSlidingUpPanel", '~> 1.0.4'
```


### How to Import

**Make sure to build and clean the project:**

```swift
import CTSlidingUpPanel
```

# Manual Setup instructions
1. Download this repository 
2. Copy files from lib folder to your project.
3. Should be done.

# How to use
You can view example project to better understand how stuff works.

But here are basic steps with Storyboard:
1. Drag any View(Or Container View) to the parent view.
**DO NOT give this view any constraints**.

2. Create outlet of the view you wish to use as bottom panel

After that in your ViewController: 

```swift
    @IBOutlet weak var bottomView: UIView!
    var bottomController:CTBottomSlideController?;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //You can provide nil to tabController and navigationController
        bottomController = CTBottomSlideController(parent: view, bottomView: bottomView, 
                        tabController: self.tabBarController!,
                        navController: self.navigationController, visibleHeight: 64)
        //0 is bottom and 1 is top. 0.5 would be center                
        bottomController?.setAnchorPoint(anchor: 0.7)
    }
    
    ///Added in Version: 1.1.0 - To support Screen orientation changes!
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        bottomController?.viewWillTransition(to: size, with: coordinator)
    }
    
```
And done, view you provided to bottomView should slide up and down.

You can do same without Storyboards. Add new subview to your parent and then provide that subview to CTBottomSlideController. 
It is recomended that you don't give that subview any constraints. 

## In case you want custom width/position of sliding panel
In this case you should set: Top, Height and other constraints that you want(**But don't set the bottom one**) to the SlidingView and then use this initializer:
```swift
bottomController = CTBottomSlideController(topConstraint: slidingPanelTopConstraint, 
                                            heightConstraint: slidingPanelHeightConstraint, 
                                            parent: view, 
                                            bottomView: bottomView, 
                                            tabController: self.tabBarController!, 
                                            navController: self.navigationController, 
                                            visibleHeight: 64)
```
**It is IMPORTANT that you don't set the bottom constraint of the sliding view** or the sliding view will start resizing and that
may affect performace.

### iPhone X Safe Area support

1. Take a Sliding View(View you provided to CTBottomSlideController) and **wrap it in a generic UIView**.
2. **Enable Clip to Bounds on the wrapper View**
3. Set any constraints you want to that **wrapper view**, place it anywhere resize it as much as you want.
4. After that in CTBottomSlideController initializer provide that wrapper **as a parrent view** instead of root view.
```swift
//This is a wrapper view
@IBOutlet weak var parentView: UIView!

//In viewDidLoad() or something
parentView.clipsToBounds = true;
bottomController = CTBottomSlideController(parent: parentView/*instead of view*/, bottomView: bottomView, 
                        tabController: self.tabBarController!,
                        navController: self.navigationController, visibleHeight: 64)
```
## Getting events from Sliding Controller
There are 2 ways of doing this. One is with delegation and other is by using closures.

### Delegation:

1.  Add this to your ViewController
```swift 
   class ViewController: UIViewController, CTBottomSlideDelegate
   {...}
```
2. Set viewcontroller as a delegate
```swift
   bottomController?.delegate = self;
```
3. Implement following methods
```swift
  func didPanelCollapse();
  func didPanelExpand();
  func didPanelAnchor();
  func didPanelMove(panelOffset: CGFloat);
```

### Closures:
```swift
 bottomController?.onPanelExpanded = {
      print("Panel Expanded in closure")
 }
        
 bottomController?.onPanelCollapsed = {
      print("Panel Collapsed in closure")
 }
        
 bottomController?.onPanelAnchored = {
      print("On Panel anchored")
 }
        
 bottomController?.onPanelMoved = { offset in
      print("Panel moved in closure " + offset.description)
 }
```

### Methods and Other stuff
Use this if you want sliding panel to slide up or down depending on TableViews offset:
```swift
func set(table:UITableView)
```
Use this if you want to specify how far up sliding panel should go
```swift
func setExpandedTopMargin(pixels: CGFloat)
```

Use these to programatically change panels state
```swift
func expandPanel();
func anchorPanel();
func closePanel();
func hidePanel();
func setSlideEnabled(bool) // Enable or disable sliding
```
Use this to check panels state
```swift 
bottomController?.currentState 
```
State can be
```swift 
.collapsed
.expanded
.anchored
.hidden
```
# Question? Bug? Request?
Feel free to open up a new issue. I will try to respond as quick as I can

