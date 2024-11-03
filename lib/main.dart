import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yelp_nyc_business/core/app_bloc_observer.dart';
import 'package:yelp_nyc_business/core/bloc/home_bloc.dart';
import 'package:yelp_nyc_business/core/interfaces/yelp_service.dart';
import 'package:yelp_nyc_business/core/models/business.dart';
import 'package:yelp_nyc_business/services/yelp_service_impl.dart';
import 'package:yelp_nyc_business/view/pages/business_details.dart';
import 'package:yelp_nyc_business/view/pages/home.dart';
import 'package:yelp_nyc_business/view/pages/routes.dart';
import 'package:yelp_nyc_business/view/theme/app_theme.dart';
import 'package:yelp_nyc_business/view/widgets/transitions/fade_route.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route<dynamic> _generateRoute(RouteSettings settings) {
    Widget newPage = Container(
        color: Colors.red,
        child: Center(
          child: Text('Not Supported!'),
        ));

    switch (settings.name) {
      case AppRoutes.home:
        newPage = const HomePage();
        break;
      case AppRoutes.details:
        final args = settings.arguments;
        newPage = BusinessDetails(
          business: args as BusinessModel,
        );
        break;
      default:
    }

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<YelpService>(
          create: (context) => YelpServiceImpl(),
        ),
      ],
      child: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          yelpService: RepositoryProvider.of<YelpService>(context),
        )..add(const GetNYCBusinessList()),
        child: MaterialApp(
          title: 'NCY Business List DEMO',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.home,
          onGenerateRoute: (settings) => _generateRoute(
            settings,
          ),
        ),
      ),
    );
  }
}
