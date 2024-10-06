## Images

![Home View](/Images/home.png "Home View.")
![External Read More](/Images/externalLink.png "External Read More.")
![Unit Tests](/Images/tests.png "Unit Tests.")

# Steps to Run the App

1. Clone the repository:

2. Ensure you have Xcode installed (version supporting Swift Concurrency).
Clone the project from the public repository.

3. Open in Xcode: Open the FetchTakeHome.xcodeproj file in Xcode.
Ensure your deployment target is set to at least iOS 16.

4. Run the app:Build and run the app using the iOS simulator or a connected device.
The app will automatically load the recipes from the API when launched and will provide options for refreshing the list.

5. Testing: To run unit tests, press Cmd + U or select the Test action from Xcode's toolbar.

# Focus Areas

I prioritized the following areas:

1. Networking and Error Handling:
Ensured efficient and reliable API communication using Swift's async/await for modern concurrency management. Handled different failure scenarios, including malformed data, empty data, and network errors. Implemented graceful error handling for both UI and backend logic.

2. Decoding and Error Validation:
Focused on robust JSON decoding to detect and properly handle malformed data, throwing specific errors such as APIError.malformedData.

3. User Experience (UX):
Designed a simple, intuitive user interface to display recipe data, handling empty states, loading indicators, and error messages.
Implemented an external link to "Read More" utilizing the API source_url

4. Caching:
Used CachedAsyncImage for efficient image loading and implemented a caching mechanism for images to avoid unnecessary bandwidth usage.

# Time Spent

I spent approximately 5 hours on the project, broken down as follows:

* Networking & API Integration: 2 hours
* Error handling and testing scenarios (malformed, empty data): 1 hour
* UI Implementation (recipe list, detail view, navigation): 1 hour
* Writing and running unit tests: 45 minutes
* Debugging and optimization: 15 minutes

# Trade-offs and Decisions
Minimal UI:

1. Due to time constraints, I opted for a minimalistic UI design with a single screen listing the recipes, though additional features like search or sorting could have been implemented.

2. Unit Tests Focus: I focused on unit testing the API service and its error handling. I chose not to implement UI and integration tests due to the limited project scope and time.

3. Error Handling Strategy: Instead of stopping at generic error messages, I opted for specific error handling (e.g., malformed data and empty responses) to improve both the developer experience and end-user feedback.

# Weakest Part of the Project
The weakest part of the project might be the simplicity of the UI/UX. While it satisfies the basic requirements, more advanced features such as filtering recipes, more sophisticated error recovery options, and richer UI could have been implemented with more time.

# External Code and Dependencies

https://github.com/lorenzofiamingo/swiftui-cached-async-image/tree/main

* CachedAsyncImage: Used for asynchronously loading and caching recipe images, avoiding third-party image caching libraries.

* Swift's async/await: Modern concurrency tools for efficient network requests and background tasks.

* XCTest Framework: Used for unit testing the APIService to verify correct error handling and recipe loading.

# Additional Information

* Malformed Data Handling: I made sure to treat any recipe list as entirely invalid if even one malformed recipe is detected, as per the project requirements. This approach ensures data integrity when displaying recipe information.

* Concurrency: By leveraging Swift’s concurrency features, the app efficiently handles network requests, allowing for smooth UI transitions while loading data.

* Refreshable List: The app supports pull-to-refresh functionality, making it easy for users to reload the recipe data at any time.
