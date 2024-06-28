/*
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportflix/colors.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:sportflix/shared/components/components.dart';


class wuscreen extends StatelessWidget {
  const wuscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getwwe(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var app = AppCubit.get(context);


          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assaets/38.png",),
                  fit: BoxFit.fitHeight
              ),),

            child: Scaffold(
                backgroundColor: Color.fromRGBO(215, 76, 76, 0),

                appBar: AppBar(
                  backgroundColor: kColorPrimaryDark,
                  title: Text("WWE &UFC LIVE"),
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assaets/38.png",),
                        fit: BoxFit.fitHeight
                    ),
                  ),
                  child: ConditionalBuilder(
                    condition: app.wwee.length > 0,
                    builder: (context) =>
                        Gradbuild(modle: app.wwee, context: context),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                )
            ),
          );
        },
      ),
    );
  }


}
*/
