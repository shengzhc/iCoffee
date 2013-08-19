iCoffee: (9.15 v1.0)

FEATURES
	. UIScrollView + PageControl --- SC (DONE)
	. Page Slider  --- Ark (DONE)
	. Design View for Coffees
	. Bottom Menu from Bottom up with finger swipping and potentially touch
		--- Content: big icons with label text
	. Bottom menu content:  Coffee Category, Coffee Make, Coffee Culture, (Find near shop), Settings, Favorites,
	. Header bar: Be simple, white, left button with home, middle with icon/text to show position
	. Recommending Content: One Scroll View with a content one page.

Theme:
1. Color: Milky + Transparent & Flat Design

Process:
1. Launching / Loading (Clean) White + Icon + Simple effect --- UI
2. Show recommending items (news, coffees, shares...)

Design:
1. Recommending Page:
	i. Header Bar: Be simple, color correspond to whole design, left home button, middle with icon/text to show current position --- Ark
   ii. Content : Scroll View with page controller, one page with one item, items should be limited. Click item will transfer to detail.  --- SC
  iii. Bottom menu bar: from bottom up with finger dragging (icon in middle) or touch (icon at two sides) --- SC
   iv. Bottom menu bar content: a. Coffee Category (coffee bean category) b. Coffee Make (cooking ways) c. Coffee Culture (Timeline) --- SC
   								d. Favorite e. Find near shop (Call Map API) f. Settings (nosiy sounds)
    v. small animated widget: a. Sound ON/OFF --- Ark

2. Coffee Bean
	i. Header Bar : #...
   ii. Content :  Table View like Umano with all kinds of coffee beans --- Ark (H)
  iii, iv, v : #...

3. Coffee Bean Detail Page
	i. Header Bar : #...
   ii. Content : Based on Content, right now just display color, maybe add like, share to small widget button --- Ark (H)
  iii, iv, v : #...


MileStone:
1. Aug. 16 21:00 (Feature 1 & 2) (CHECKED)
2. Aug. 23 17:00 (Structure)

BrainStorm:
1. Launching: Coffee Color -> Mixed Color -> Milky Color
2. Little Button animation to show different features
3. Bottom menu bar (AMC)
4. Coffee Culture using timeline
5. Under Welcome Screen, show new, we can add a dynamic posting to show the recently message that is posted by the people ( NEED API Support)

Questions:
Half of the first cell of a tableview is blocked by the navigation bar (resolved). --- ARK

Build code and git standards. 
Communicat first before modifying others' codes. 



Resources:

Slide out navigation:
http://www.raywenderlich.com/32054/how-to-create-a-slide-out-navigation-like-facebook-and-path

Enhance:



TODO:

Aug. 10th
1. Zoom in and out in the whole screen based on buttons (RESOLVED)
2. Present a modal view controller that will contain the main view controllers (RESOLVED)
	
	
Aug. 11st
1. Optimize the code for Safari Tabs, and add README.txt for the project (RESOLVED) --- SC
2. Umano top slider mock up (RESOLVED)--- SC
3. Learning http://www.raywenderlich.com/32054/how-to-create-a-slide-out-navigation-like-facebook-and-path(DONE)	--- ARK


Aug. 12nd
1. Safari Tabs issue: zooming in frame is incorrect (RESOLVED) --- SC


Aug. 13rd
1. Finish the function of Slide out navigation.(Done) ---ARK


Aug. 14th
1. Finish the Umano top slider feature and fix Safari Tabs frame issue. (RESOLVED) --- SC
2. Use navigation view controllers.(DONE) --- ARK
3. Add scrollling behavior for Umano scroll up. (RESOLVED) --- SC


Aug. 15th
1. Add gestures. (DONE) --- ARK
2. Learn how to import ttf font. --- SC
3. Meeting about the design of how to display coffees. (RESOLVED) --- Group


Aug. 16th
1. Make gestures perfect. (In progess)--- ARK
2. Code review.(In progress) --- ARK 


Aug. 17th
1. Content : Scroll View with page controller, one page with one item, items should be limited, 
	except (Click item will transfer to detail) (RESOLVED) --- SC
2. Bottom menu bar: from bottom up with finger dragging (icon in middle) or touch (icon at two sides) (RESOLVED) --- SC

Aug. 18th
1. Add Swipe behavior to Bottom menu bar, which can have, but not necessarily (RESOLVED) --- SC
2. Figure out import ttf and change the font family (RESOLVED) --- SC
3. Review code (RESOLVED) ---  SC
4. Add animation for bottom menu button transition (RESOLVED) --- SC 

Aug. 19th
1. Do research on iAd (RESOLVED) --- SC
2. Research on Google Places API ( 2 days ) --- SC
3. Beans table view and Detail View. --- ARK


Aug. 17th - Aug. 23 (Backend)
1. Set up backend architecture
2. Coffee bean object
{
	"name":string
	"origin":string
	"rating":decimal
	"description":
	"image":
	"id":
}
return [{}, {}, {}]
3. Coffee Make object
{
	TBD
}