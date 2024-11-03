import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yelp_nyc_business/core/bloc/home_bloc.dart';
import 'package:yelp_nyc_business/view/widgets/cards/business_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _mainContent(HomeState state) {
    if (state is HomeLoading || state is HomeInitial) {
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
        itemCount: state.businesses.length,
        itemBuilder: (context, index) {
          final business = state.businesses[index];
          return BusinessCard(business: business);
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
