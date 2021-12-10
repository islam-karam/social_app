import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout/social_cubit.dart';
import 'package:social_app/models/message_model/message_model.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/shared/styles/colors/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  UserModel userModel;

  ChatDetailsScreen({this.userModel});

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).getMessages(receiverId: userModel.uId);
        return BlocConsumer<SocialCubit, SocialState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(userModel.image),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(userModel.name),
                    ],
                  ),
                ),
                body: ConditionalBuilder(
                  condition: SocialCubit.get(context).messages.length > 0,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              var message =
                                  SocialCubit.get(context).messages[index];
                              if (SocialCubit.get(context).userModel.uId ==
                                  message.senderId)
                                return myMessageBuild(message);
                              else
                                return messageBuild(message);
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: SocialCubit.get(context).messages.length,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'write your message here ...',
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: MaterialButton(
                                  minWidth: 1,
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: defaultColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: MaterialButton(
                                  minWidth: 1,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    SocialCubit.get(context).sendMessage(
                                      receiverId: userModel.uId,
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ));
          },
          listener: (context, state) {},
        );
      },
    );
  }

  Widget messageBuild(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Text('${model.text}'),
        ),
      );

  Widget myMessageBuild(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: defaultColor.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Text('${model.text}'),
        ),
      );
}
