# Swift-CTSlidingUpPanel
Transforms any view to sliding panel

Panel supports Anchor points, TabBarController and NavigationController, also it has basic TableView support.

<img src="https://thumbs.gfycat.com/OffbeatCaringGalago-size_restricted.gif" width="350">

# Setup instructions
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
```
And done, view you provided to bottomView should slide up and down.

You can do same without Storyboards. Add new subview to your parent and then provide that subview to CTBottomSlideController. 
It is recomended that you don't give that subview any constraints. 

### Delegation and stuff
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
### Methods and Other stuff
Use this if you want sliding panel to slide up or down depending on TableViews offset:
```swift
func set(table:UITableView)
```
Use these to programatically change panels state
```swift
func expandPanel();
func anchorPanel();
func closePanel();
func hidePanel();
```
Use this to check panels state
```swift bottomController?.currentState ```
State can be
```swift 
.collapsed
.expanded
.anchored
.hidden
```
