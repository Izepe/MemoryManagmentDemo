# MemoryManagmentDemo

This project was created with the objective to exemplify memory leaks and problems, as well as give examples of good memory management

## Leak Example 

The first example of a leak is a simple cross reference in the Details View model, this is caused by the use of self on the callback withou declaring it weak first

![Screen Shot 2022-12-20 at 10 07 15](https://user-images.githubusercontent.com/99685544/208674475-af9ec5c9-ec32-4792-a13e-f3cadda77558.png)

We can see that the automatic leak detection from the Profiling Tools was not able to identify this leak

![Screen Shot 2022-12-19 at 16 10 37](https://user-images.githubusercontent.com/99685544/208674675-2e689d2e-06b6-41e4-a6a9-533a6ff5e6cd.png)

## SwiftUI View presentation Memory management

SwiftUI NavigationLinks, sheets and full modals have a memory management behavior to keep themselvs in memory even after the view is dismissed, this is done because the view creation takes a lot of processing, so the OS favors efficiency over memory cosumption, so far I was not able to find a way to force the removal from meory. You can see the memory increasing in theimage bellow

![Screen Shot 2022-12-20 at 10 10 20](https://user-images.githubusercontent.com/99685544/208675014-da8c6b0c-9295-4865-be29-191966c4af19.png)

Another things to keep in mind is that Lists pre load every page on start, so before the user event selectes an element the view will be created, so any API calls orother heavy processing you do on init will be triggered even if the view is not used. To avoid this you either have to not use Lists, create a Lazya dapter that will make it so the views are only instatiated when called or change you processing to only happen on the view appear.

## Caches and other components Memory release

While creating views you might want to store data to avoid multiple call to a resource unnecessarily, when creating those remember that the system can run out of memory. So add a observable for the notification in order to clear the cache if that happens

![Screen Shot 2022-12-20 at 10 17 25](https://user-images.githubusercontent.com/99685544/208676248-527b2d88-67ce-4474-95db-2ee15e163c38.png)
