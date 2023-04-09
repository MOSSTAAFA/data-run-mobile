// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
//
// /// to reference a provider I can use:
// /// 1- ConsumerWidget:
// ///   ConsumerWidget is a good replacement for StatelessWidget and gives us a
// ///   convenient way of accessing providers with minimal code.
// /// 2- stateless widget as usual by wrapping the small widget that depends on the
// /// provider using consumer:
// /// return Scaffold(
// ///       appBar: AppBar(),
// ///      // 1. Add a Consumer
// ///       body: Consumer(
// ///         // 2. specify the builder and obtain a WidgetRef
// ///         builder: (_, WidgetRef ref, __) {
// ///           // 3. use ref.watch() to get the value of the provider
// ///          final helloWorld = ref.watch(helloWorldProvider);
// ///           return Text(helloWorld);
// ///         },
// ///       ),
// ///     );
// /// 3- Using ConsumerStatefulWidget & ConsumerState:
// /// When we subclass from ConsumerState, we can access the ref object inside
// /// all the widget lifecycle methods. This is because ConsumerState declares
// /// WidgetRef as a property, much like the Flutter State class declares
// /// BuildContext as a property that can be accessed directly
// /// inside all the widget lifecycle methods.
// /// Note that there are some similarities between BuildContext and WidgetRef:
// ///   - BuildContext lets us access ancestor widgets in the widget tree
// ///   (such as Theme.of(context) and MediaQuery.of(context)).
// ///   - WidgetRef lets us access any provider inside our app
// ///
// /// Riverpod offers eight different kinds of providers:
// ///   1- Provider: is great for accessing dependencies and objects that don’t change.
// ///   2- StateProvider (legacy)
// ///   3- StateNotifierProvider (legacy)
// ///   4- FutureProvider
// ///   5- StreamProvider
// ///   6- ChangeNotifierProvider (legacy)
// ///   7- NotifierProvider (new in Riverpod 2.0)
// ///   8- AsyncNotifierProvider (new in Riverpod 2.0)
// ///   2. StateProvider
//
// /// 2- StateProvider (legacy) is great for storing simple state objects that can change,
// /// such as a counter value:
// final StateProvider<int> counterStateProvider =
//     StateProvider<int>((StateProviderRef<int> ref) {
//   return 0;
// });
//
// /// If you watch it inside the build method, the widget will rebuild when
// /// the state changes.
// /// And you can update its state inside a button callback by calling ref.read():
// class CounterWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 1. watch the provider and rebuild when the value changes
//     final int counter = ref.watch(counterStateProvider);
//     return ElevatedButton(
//       // 2. use the value
//       child: Text('Value: $counter'),
//       // 3. change the state inside a button callback
//       onPressed: () => ref.read(counterStateProvider.notifier).state++,
//     );
//   }
// }
//
// /// StateProvider is ideal for storing simple state variables, such as enums,
// /// strings, booleans, and numbers. Notifier can also be used for the
// /// same purpose and is more flexible.
// /// For more complex or asynchronous state, use AsyncNotifierProvider,
// /// FutureProvider, or StreamProvider as described below.
//
// /// 3. StateNotifierProvider (legacy)
// /// Use this to listen to and expose a StateNotifier.
// /// StateNotifierProvider and StateNotifier are ideal for managing state
// /// that may change in reaction to an event or user interaction.
// class Clock extends StateNotifier<DateTime> {
//   // 1. initialize with current time
//   Clock() : super(DateTime.now()) {
//     // 2. create a timer that fires every second
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       // 3. update the state with the current time
//       state = DateTime.now();
//     });
//   }
//
//   late final Timer _timer;
//
//   // 4. cancel the timer when finished
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }
//
// /// Once we have this, we can create a new provider:
// // Note: StateNotifierProvider has *two* type annotations
// final StateProvider<Clock, DateTime> clockProvider =
//     StateNotifierProvider<Clock, DateTime>(
//         (StateNotifierProviderRef<Clock, DateTime> ref) {
//   return Clock();
// });
//
// /// Then, we can watch the clockProvider inside a ConsumerWidget to get the
// /// current time and show it inside a Text widget:
// // Note: ref.watch(clockProvider) returns the provider's state.
// // To access the underlying state notifier object,
// // call ref.read(clockProvider.notifier) instead.
// class ClockWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // watch the StateNotifierProvider to return a DateTime (the state)
//     final DateTime currentTime = ref.watch(clockProvider);
//     // format the time as `hh:mm:ss`
//     final String timeFormatted = DateFormat.Hms().format(currentTime);
//     return Text(timeFormatted);
//   }
// }
//
// /// As of Riverpod 2.0, StateNotifier is considered legacy and can be
// /// replaced by the new AsyncNotifier class.
// ///
// /// Note that using StateNotifierProvider is overkill if you only need
// /// to read some async data. That's what FutureProvider is for. 👇
// /// 4. FutureProvider
// ///   Want to get the result from an API call that returns a Future?
// ///   Then just create a FutureProvider like this:
//
// final AutoDisposeFutureProvider weatherFutureProvider =
//     FutureProvider.autoDispose<Weather>((AutoDisposeFutureProviderRef ref) {
//   // get repository from the provider below
//   final weatherRepository = ref.watch(weatherRepositoryProvider);
//   // call method that returns a Future<Weather>
//   return weatherRepository.getWeather(city: 'London');
// });
//
// // example weather repository provider
// final Provider weatherRepositoryProvider =
//     Provider<WeatherRepository>((ProviderRef ref) {
//   return WeatherRepository(); // declared elsewhere
// });
//
// /// Then you can watch it in the build method and use pattern matching to
// /// map the resulting AsyncValue (data, loading, error) to your UI:
// Widget build(BuildContext context, WidgetRef ref) {
//   // watch the FutureProvider and get an AsyncValue<Weather>
//   final AsyncValue<Weather> weatherAsync = ref.watch(weatherFutureProvider);
//   // use pattern matching to map the state to the UI
//   return weatherAsync.when(
//     loading: () => const CircularProgressIndicator(),
//     error: (Object err, StackTrace stack) => Text('Error: $err'),
//     data: (weather) => Text(weather.toString()),
//   );
// }
// /// FutureProvider is very powerful, and you can use it to:
// ///   - perform and cache asynchronous operations (such as network requests)
// ///   - handle the error and loading states of asynchronous operations
// ///   - combine multiple asynchronous values into another value
// ///   - re-fetch and refresh data (useful for pull-to-refresh operations)
// //----------------------------
//
// /// Listening to Provider State Changes:
// ///   - Sometimes we want to show an alert dialog or a SnackBar when
// ///     a provider state changes.
// ///   - We can do this by calling ref.listen() inside the build method:
// final counterListenerStateProvider = StateProvider<int>((_) => 0);
//
// class CounterListenerWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // if we use a StateProvider<T>, the type of the previous and current
//     // values is StateController<T>
//     ref.listen<StateController<int>>(counterStateProvider.state, (previous, current) {
//       // note: this callback executes when the provider value changes,
//       // not when the build method is called
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Value is ${current.state}')),
//       );
//     });
//     // watch the provider and rebuild when the value changes
//     final counter = ref.watch(counterStateProvider);
//     return ElevatedButton(
//       // use the value
//       child: Text('Value: $counter'),
//       // change the state inside a button callback
//       onPressed: () => ref.read(counterStateProvider.notifier).state++,
//     );
//   }
// }
//
// ///////////////////////////////////
//
// final movieProvider = FutureProvider.autoDispose<TMDBMovieBasic>((ref) async {
//   // get the repository
//   final moviesRepo = ref.watch(fetchMoviesRepositoryProvider);
//   // an object from package:dio that allows cancelling http requests
//   final cancelToken = CancelToken();
//   // when the provider is destroyed, cancel the http request
//   ref.onDispose(() => cancelToken.cancel());
//   // if the request is successful, keep the response
//   ref.keepAlive();
//   // call method that returns a Future<TMDBMovieBasic>
//   return moviesRepo.movie(movieId: 550, cancelToken: cancelToken);
// });
//
// ///////////
// /// For a real-world example of how to combine providers and
// /// handle multiple dependencies in a complex app, read this:
// /// (Flutter App Architecture: The Application Layer) [https://codewithandrea.com/articles/flutter-app-architecture-application-layer/]
//
// /// Note that we can only create a DynamicLinksService with a Ref object,
// /// and the main() method doesn't have one. 🧐
// /// To solve this chicken-and-egg problem 🐣,
// /// we need to use a ProviderContainer. Here's how:
// /// void main() async {
// ///   // Normal initialization
// ///   WidgetsFlutterBinding.ensureInitialized();
// ///   await Firebase.initializeApp(
// ///     options: DefaultFirebaseOptions.currentPlatform,
// ///   );
// ///   // 1. Create a ProviderContainer
// ///   final container = ProviderContainer();
// ///   // 2. Use it to read the provider
// ///   container.read(dynamicLinksServiceProvider);
// ///   // 3. Pass the container to an UncontrolledProviderScope and run the app
// ///   runApp(UncontrolledProviderScope(
// ///     container: container,
// ///     child: const MyApp(),
// ///   ));
// /// }