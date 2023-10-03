# flutter_riverpod_freezed

This repo contains a modified fork of <https://github.com/red-star25/riverpod_example>.  He wrote a blog post to explain the code at: <https://dhruvnakum.xyz/flutter-riverpod-effortlessly-managing-api-calls-in-your-app>

This code demonstrates the use of [Riverpod](https://riverpod.dev/) for state management, [Freezed](https://pub.dev/packages/freezed) to generate the data model classes, and [Dio](https://pub.dev/packages/dio) to access an external service.

In this fork, I have eliminated some superfluous dependencies (related to internationalization and screen utilities) from the original code so that it more clearly focuses on Riverpod, Freezed, and Dio. I've also updated all the packages and made other minor code changes so that the code runs correctly as of Fall, 2023. 

## Screenshots

<p style="text-align: center">
  <img src="https://github.com/philipmjohnson/flutter_riverpod_freezed/raw/main/README-home.png" width="30%">
   &nbsp;
  <img src="https://github.com/philipmjohnson/flutter_riverpod_freezed/raw/main/README-jokes.png" width="30%">
   &nbsp;
  <img src="https://github.com/philipmjohnson/flutter_riverpod_freezed/raw/main/README-products.png" width="30%">
</p>

## Design of the Joke Page

The Joke page displays a joke retrieved from a Joke API service when a button is pushed. It provides an implementation of a good design pattern for real-time retrieval of data from an external, non-Firebase data source.  

* The JokePage is watching jokeDataProvider and so is refreshed each time the state of a joke retrieval changes.  This page contains a Floating Action Button to retrieve a joke. The page itself either displays a CircularProgressIndicator if a joke is being retrieved, or a JokeView if not in the process of retrieving a joke.

* The JokeView is passed a string containing a joke from the calling JokePage, and displays it.

* RefreshJoke is a wrapper around the FloatingActionButton in JokePage.  When the button is pressed, it calls the getJoke() method of jokeDataProvider.

* jokeDataProvider uses StateNotifierProvider and returns a JokeDataNotifier. 

* JokeDataNotifier is a StateNotifier whose state variable manages an instance of JokeState. The state is initialized to an empty instance of JokeState. When the getJoke() method is called, the state is set to a new instance of JokeState where isLoading is set to true. Then the API call is made. When it returns, the state is updated to a new JokeState containing the joke that was retrieved and with isLoading set to false.  

For the data model, JokeModel and JokeState are generated using Freezed.

## Source code

The source code is available at: <https://github.com/philipmjohnson/flutter_riverpod_freezed>.
