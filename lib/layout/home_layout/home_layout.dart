import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'social_cubit.dart';
import '../../modules/new_post/post_screen.dart';
import '../../shared/componantes/componantes.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if(state is SocialPostBottomState)
          navigateTo(context, NewPostScreen());
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_active_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'CHAT',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upload_file),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined), label: 'USERS'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'SETTING'),
            ],
          ),
        );
      },
    );
  }
}
