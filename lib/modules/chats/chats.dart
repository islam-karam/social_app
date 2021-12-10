
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout/social_cubit.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/modules/chat_details/chat_details_screen.dart';
import 'package:social_app/shared/componantes/componantes.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length>0,
          builder:(context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => chatItem(SocialCubit.get(context).users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount:  SocialCubit.get(context).users.length,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget chatItem(UserModel userModel,context) => InkWell(
    onTap: (){
      navigateTo(context, ChatDetailsScreen(userModel: userModel,));
    },
    child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage('${userModel.image}'),
              ),
              SizedBox(
                width: 15,
              ),
              Text('${userModel.name}',
                  style: TextStyle(
                    height: 1,
                  )),
            ],
          ),
        ),
  );
}
