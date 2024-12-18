# Book Discovery App

## Overview
This Flutter-based mobile application allows users to view a dynamic list of books, featuring their titles, authors, and cover images. The app integrates with the **Gutendex API** to fetch book data and presents an intuitive, efficient, and responsive user experience through the adoption of industry-standard architectural principles and best practices.

### Key Features & Technologies

#### 1. **Clean Architecture**
The app adheres to the principles of **Clean Architecture**, which promotes separation of concerns across three primary layers:
- **Presentation Layer**: Handles the UI components and user interaction.
- **Business Logic Layer**: Manages the application's core functionality and processes (implemented using Cubits).
- **Data Layer**: Responsible for managing data sources and network requests.

By adhering to Clean Architecture, the codebase remains maintainable, scalable, and testable, ensuring that future changes to the app (whether UI enhancements, business logic modifications, or data source integrations) can be managed independently.

#### 2. **State Management with `BookListCubit`**
State management is efficiently handled using the **Cubit** pattern from the `flutter_bloc` package. The `BookListCubit` manages the state of the book list, ensuring predictable UI updates as the app interacts with the data layer. The app's state transitions, including loading, loaded, and error states, are neatly encapsulated within the Cubit, allowing for optimal performance and maintainability.

#### 3. **Error Handling**
Comprehensive error handling mechanisms are in place to provide meaningful feedback to users. Whenever network or parsing errors occur, the user is informed with actionable messages, allowing for a seamless and pleasant experience, even in the face of failures. This proactive approach ensures that the app is resilient and can gracefully handle unexpected conditions.

#### 4. **Pagination for Dynamic Data Loading**
To enhance user experience, the app implements a **pagination** mechanism that loads book data dynamically as the user scrolls through the list. Initially, the app fetches a default set of books from the Gutendex API, and as the user approaches the end of the list, additional books are fetched from subsequent page via an API call. This lazy-loading approach ensures minimal initial loading time and efficiently handles large datasets.

- **SliverList**: The app uses `SliverList.builder` for efficient, on-demand rendering of book list items. This approach reduces memory usage and enhances scrolling performance, particularly when dealing with large lists.
- **Cached Network Images**: Book cover images are cached using the `cached_network_image` package, ensuring that images are loaded quickly throughout the app’s lifecycle and minimizing redundant network requests.

#### 5. **Responsive and Adaptive UI**
The app features a **SliverAppBar**, which dynamically adjusts its appearance based on the user's scroll position. This creates a smooth and engaging experience as the user interacts with the list. The app's layout adapts seamlessly to different screen sizes and orientations, providing an optimal experience across various devices.

#### 6. **Search Functionality with Filters**
A robust **search functionality** allows users to filter books based on multiple criteria, including:
- **Author Name**
- **Book Title**
- **Topic**

Users can select their preferred filter and enter a search query to easily locate specific books. The search feature provides a refined and efficient means of navigating through the extensive list of books.

#### 7. **Book Details View**
When a user taps on any book image from the list, the app navigates to a **Book Details View**. This screen presents detailed information about the selected book, enhancing the user experience with richer content.

#### 8. **Support for Multiple Languages**
The app provides full support for displaying text in **Japanese, Korean, and Chinese**, leveraging custom fonts included in the assets:
- **NotoSansJP** for Japanese
- **NotoSansKR** for Korean
- **NotoSansTC** for Traditional Chinese

This ensures proper rendering of text in various languages, providing a smooth experience for users from different regions.

#### 9. **UTF-8 and JSON Decoding**
To properly handle multilingual data, the app first decodes the UTF-8-encoded content from the Gutendex API before decoding the JSON response. This dual-decoding approach ensures that book titles, authors, and other textual information are displayed correctly, preserving the integrity of characters in their native languages.


## BookList View and Cubit

### Classes and Responsibilities

#### BookListState
* **States:**
  - **BookListInitial:** Initial state when the screen is first loaded.
  - **BookListLoading:** Indicates that the data is being fetched.
  - **BookListLoaded:** Represents the successful fetching of books, including the list of books and the URL for the next page.
  - **BookListError:** Represents an error in fetching books, including an error message.

#### BookListCubit
* **State Management:** Manages the state of the book list using the `BookListState` sealed class.
* **Data Fetching:** Fetches the initial list of books and subsequent pages when the user scrolls to the bottom.
* **Error Handling:** Handles potential errors during data fetching and emits a `BookListError` state.

#### BookListView
* **UI Rendering:** Renders the UI based on the current state.
* **State Management:** Listens to state changes from the `BookListCubit` and updates the UI accordingly.
* **Pagination:** Detects when the user scrolls to the bottom and triggers the `fetchNextPage` method of the `BookListCubit`.
* **Error Handling:** Displays an error message if the data fetching fails.

### How it Works
1. **Initial State:** The `BookListPage` initializes the `BookListCubit` and triggers the `fetchBooks` method.
2. **Data Fetching:** The `BookListCubit` emits a `BookListLoading` state, fetches the initial list of books, and then emits a `BookListLoaded` state with the fetched books and the next page URL.
3. **UI Update:** The `BookListViewBlocBuilder` listens to the state changes and updates the UI accordingly. It displays a progress indicator while loading and a list of books once the data is fetched.
4. **Pagination:** When the user scrolls to the bottom of the list and the `nextPageUrl` is not null, the `BookListCubit` fetches the next page of books and emits a new `BookListLoaded` state with the updated list of books.
5. **Error Handling:** If an error occurs during data fetching, the `BookListCubit` emits a `BookListError` state, and the `BookListViewBlocBuilder` displays an error message.

## Scope of Improvement

### Caching of Book List for Enhanced Performance

One potential area of improvement is the **caching of the book list** to optimize performance and reduce unnecessary API calls. Currently, when a user performs multiple searches, the app loads and fetches new data from the **Gutendex API** each time a new search term is entered. This can lead to increased network usage and longer loading times as the user navigates between different search results or returns to the default/initial book list.

#### Proposed Solution:
To enhance the user experience, I propose implementing **in-memory caching** using a **Map Data Structure**. The cache can store previously fetched book lists, allowing the app to retrieve and display books from memory without needing to make additional API calls. This approach would benefit the app in the following ways:
- **Reduced API Calls**: By storing search results in memory, repeated searches for the same term will fetch data from the cache instead of initiating a new request to the server.
- **Faster Loading Times**: Cached data can be served almost instantaneously, significantly reducing the time required to display search results or the default list of books, especially for subsequent user interactions during the same session.
- **Improved User Experience**: Users will experience faster and more responsive navigation through the app, enhancing overall satisfaction, particularly when browsing multiple search results or revisiting previously viewed content.

#### Technical Details:
- When a search term is entered or a default list is requested, the app will first check if the data for that term or list is already present in the in-memory cache.
- If the data is found in the cache, it will be retrieved and displayed immediately.
- If the data is not found, the app will fetch it from the Gutendex API, store the result in memory, and present it to the user.
- The cache can be implemented using a **Map** where the keys are the search terms or identifiers for the book list, and the values are the corresponding book data.

This caching mechanism will significantly reduce network overhead and improve the app's responsiveness, making it more efficient in handling repeated searches and the display of books.

---