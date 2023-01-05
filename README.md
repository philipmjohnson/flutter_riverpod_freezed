# flutter_riverpod_freezed


This is a fork of <https://github.com/red-star25/riverpod_example>.  He wrote a blog post to explain the code at: <https://dhruvnakum.xyz/flutter-riverpod-effortlessly-managing-api-calls-in-your-app>

This code demonstrates the use of Riverpod for state management and freezed to generate the data model classes. 

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_example_screenshots/raw/main/README-switch-color-controller-riverpod-1.png" width="45%">
  <img src="https://github.com/philipmjohnson/flutter_example_screenshots/raw/main/README-switch-color-controller-riverpod-2.png" width="45%">
</p>

## Implementation notes

* Uses <https://pub.dev/packages/flutter_gen_runner> to provide enumerated constants for accessing assets. (Even though there are no assets).

* Uses <https://pub.dev/packages/dio> as an HTTP client for managing the HTTP requests to the Jokes and Store cloud-based services. 

## The Joke Page

The Joke page displays a joke retrieved from a Joke API service when a button is pushed. It provides an implementation of a good design pattern for real-time retrieval of data from an external, non-Firebase data source.  

* The [JokePage] is watching [jokeDataProvider] and so is refreshed each time the state of a joke retrieval changes.  This page contains a Floating Action Button to retrieve a joke. The page itself either displays a [CircularProgressIndicator] if a joke is being retrieved, or a [JokeView] if not in the process of retrieving a joke.

* The [JokeView] is passed a string containing a joke from the calling [JokePage], and displays it.

* [RefreshJoke] is a wrapper around the [FloatingActionButton] in [JokePage].  When the button is pressed, calls the getJoke() method of [jokeDataProvider].

* [jokeDataProvider] uses [StateNotifierProvider] and returns a [JokeDataNotifier]. 

* [JokeDataNotifier] is a [StateNotifier] whose state variable manages an instance of [JokeState]. The state is initialized to an empty instance of [JokeState]. When the getJoke() method is called, the state is set to a new instance of [JokeState] where isLoading is set to true. Then the API call is made. When it returns, the state is updated to a new [JokeState] containing the joke that was retrieved and with isLoading set to false.  
