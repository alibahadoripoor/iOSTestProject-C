# iOSTestProject-C

This application is a Social network application for retrieving some sample posts by using Jsonplaceholder.typicode.com services.

This app is written with Swift programming language for iOS and with other technologies and frameworks like UIKit, MVVM Design Pattern, HTTP REST API, JSON, Unit Testing, XCTest supporting Dark Mode, etc. 

## Implementation
- In the main view, we will see all the posts from all the users. 
- On the next page, we will see all details of the post that is selected.

## Possible Improvements
- Providing some information about the owner of each post in the post object that we receiving from the API, because if it is like this we do not need to send an additional request for the users' information to the server anymore.
- Providing the possibility of setting the number of the posts per request, because we do not need to get all posts from the server. It would be a big problem in the future when the number of posts did grow. we can use pagination instead.
- I think after the modifications above is a better situation to have some sort of persistence mechanism. For example, we can save some of the last posts in the DataBase by using CoreData or Realm frameworks and implementing Repository Pattern.
- Adding some more content for users and posts like profile pictures for users and etc, to make the UI more beautiful and user-friendly.
- Adding a user profile page for seeing the users' profile details like pictures, all the posts of that user and etc. 

## Run
To run please open iOSTestProject-C.xcodeproj chose device or simulator and run.

## Requirements
XCode 11
Swift 5

### Project Sketch File
https://www.figma.com/file/AdcLFOEE7wjzf0l0SrtTRc/iOSTestProject-C?node-id=0%3A1
