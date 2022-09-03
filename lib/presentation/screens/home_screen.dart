import 'package:bloc_example/logic/cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/enum.dart';
import '../../logic/cubit/counter_cubit.dart';
import '../../logic/cubit/counter_state.dart';
import '../../logic/cubit/internet_state.dart';
import '../component/circular_button.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Color color;
  const HomePage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
          appBar: AppBar(title: Text(title), backgroundColor: color),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return Text('Wifi is COnnected',
                    style: Theme.of(context).textTheme.headline6);
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return Text('Data is COnnected',
                    style: Theme.of(context).textTheme.bodySmall);
              } else if (state is InternetDisconnected) {
                return Text('No Internet',
                    style: Theme.of(context).textTheme.bodySmall);
              } else
                return CircularProgressIndicator();
            }),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300)));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Decremented'),
                      dismissDirection: DismissDirection.up,
                      duration: Duration(milliseconds: 300)));
                }
              },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  icon: Icons.minimize,
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                ),
                const SizedBox(
                  width: 100,
                ),
                Button(
                  icon: Icons.add,
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.secondScreen);
              },
              child: const Text('Second Screen'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.thirdScreen);
              },
              child: const Text('Third Screen'),
            )
          ])),
    );
  }
}
