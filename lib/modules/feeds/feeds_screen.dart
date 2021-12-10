import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/post_model/post_model.dart';
import '../../layout/home_layout/social_cubit.dart';

class FeedsScreen extends StatelessWidget {

  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0 && SocialCubit.get(context).userModel != null,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10.0,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                        image: NetworkImage(
                          '${userModel.cover}',
                        ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friendes',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildePostItem(
                      SocialCubit.get(context).posts[index], context,index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildePostItem(PostModel model, context,index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage('${model.image}'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${model.name}',
                                style: TextStyle(
                                  height: 1,
                                )),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${model.dateTime}',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(height: 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.subtitle1,
              ),


              //   Padding(
              //   padding: const EdgeInsets.symmetric(
              //     vertical: 10,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 10,
              //           ),
              //           child: Container(
              //             height: 20,
              //             child: MaterialButton(
              //               onPressed: () {},
              //               minWidth: 1,
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#software',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: Colors.blue,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 10,
              //           ),
              //           child: Container(
              //             height: 20,
              //             child: MaterialButton(
              //               onPressed: () {},
              //               minWidth: 1,
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#Artificial intelligence',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: Colors.blue,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 10,
              //           ),
              //           child: Container(
              //             height: 20,
              //             child: MaterialButton(
              //               onPressed: () {},
              //               minWidth: 1,
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#flutter_Dev',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: Colors.blue,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 10,
              //           ),
              //           child: Container(
              //             height: 20,
              //             child: MaterialButton(
              //               onPressed: () {},
              //               minWidth: 1,
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#software_development',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: Colors.blue,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 10,
              //           ),
              //           child: Container(
              //             height: 20,
              //             child: MaterialButton(
              //               onPressed: () {},
              //               minWidth: 1,
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#software',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: Colors.blue,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),


              if (model.postImage != '')
                Container(
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.message,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialCubit.get(context).comments[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // child: InkWell(
                    //   child: Row(
                    //     children: [
                    //       CircleAvatar(
                    //         radius: 20,
                    //         backgroundImage: NetworkImage(
                    //             '${SocialCubit.get(context).userModel.image}'),
                    //       ),
                    //       SizedBox(
                    //         width: 15,
                    //       ),
                    //       Text(
                    //         'write comment',
                    //         style: Theme.of(context).textTheme.caption,
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: () {},
                    // ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: 'write comment',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.done_rounded,color: Colors.black,), onPressed: (){
                          SocialCubit.get(context).commentPost(SocialCubit.get(context).postsId[index], commentController.text);

                        }),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.favorite_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {
                      SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
























