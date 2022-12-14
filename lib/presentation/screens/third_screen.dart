import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';
import '../../logic/cubit/counter_state.dart';
import '../component/circular_button.dart';

class ThirdScreen extends StatelessWidget {
  final String title;
 final Color color;
  const ThirdScreen({Key? key,required this.title,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text(title),
        backgroundColor:color),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                style: Theme.of(context).textTheme.displayMedium,
              );
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Button(
          //       icon: Icons.minimize,
          //       onTap: () {
          //         BlocProvider.of<CounterCubit>(context).decrement();
          //       },
          //     ),
          //     const SizedBox(
          //       width: 100,
          //     ),
          //     Button(
          //       icon: Icons.add,
          //       onTap: () {
          //         BlocProvider.of<CounterCubit>(context).increment();
          //       },
          //     ),
          //   ],
          // )
        ]));
  }
}
