import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yelp_nyc_business/core/bloc/home_bloc.dart';
import 'package:yelp_nyc_business/view/pages/routes.dart';
import 'package:yelp_nyc_business/view/widgets/cards/business_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      BlocProvider.of<HomeBloc>(context).add(const GetNYCBusinessList());
    }
  }

  Widget _mainContent(HomeState state) {
    if (state is HomeInitial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is HomeError) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is HomeLoaded) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: state is HomeLoading || state is HomeFullyLoaded
            ? state.businesses.length + 1
            : state.businesses.length,
        itemBuilder: (context, index) {
          if (index >= state.businesses.length) {
            return state is HomeFullyLoaded
                ? SizedBox(
                    height: 60,
                    child: Center(child: Text('--- End of List ---')))
                : SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
          }

          final business = state.businesses[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.details,
                  arguments: business),
              child: BusinessCard(business: business));
        },
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false, // Hides the back button
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text('NYC Business List',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
          ),
          body: _mainContent(state),
        );
      },
    );
  }
}
