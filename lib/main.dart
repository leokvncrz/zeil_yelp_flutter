import 'package:flutter/material.dart';
import 'package:yelp_nyc_business/view/pages/routes.dart';
import 'package:yelp_nyc_business/view/theme/app_theme.dart';
import 'package:yelp_nyc_business/view/widgets/transitions/fade_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route<dynamic> _generateRoute(RouteSettings settings) {
    Widget newPage = Container();

    return FadeRoute(
      page: Theme(
        data: lightTheme,
        child: newPage,
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NCY Business List DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) => _generateRoute(
        settings,
      ),
    );
  }
}
