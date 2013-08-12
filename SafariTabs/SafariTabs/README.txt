Objective:
    This project is to demonstrate the similar behavior of Safari Tabs which enables scrolling 
    between pages and select page to zoom in/out to show details of each page.
    
    
Features & Difficulties:
    1. Page Scrolling
    2. Different scrolling area at diffferent page
    3. Click page to scroll and zoom when current page is selected
    4. Present modal view controller when display different page
    5. Simulate animation for zoom in/out
    

Key:
    1. The scrollview's frame is not as big as it seems to be, unset clipToBounds to show extra 
    content of scrollview. 
    2. Control the touch event of scrollview's superview and pass the "defined" scrollview's area down to enable scrolling (hitTest::)
    3. When displaying the first and last page, we should disable the left/right margin scrolling. For this purpose, adding dummy wall view and dynamically changing the wallview's frame to disable the returned view of hitTest::.
    

Lessons:
    1. scrollview paging is respond to its frame.
    2. scrollview's clip to bounds property.
    3. hitTest:: returns the furthest view that can handle the touch event
    4. zooming in/out animation can be done by adding a small view to the middle and then make
    it full screen. When animation finished, push the viewcontroller without animation and
    and remove the previous adding view to the window.

