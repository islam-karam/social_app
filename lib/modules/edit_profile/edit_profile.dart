import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/home_layout/social_cubit.dart';
import '../../shared/componantes/componantes.dart';

class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {

        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).profileImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTextButton(
                function: () {
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                text: 'Update',
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      5.0,
                                    ),
                                    topLeft: Radius.circular(
                                      5.0,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage(
                                            '${userModel.cover}',
                                          )
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.photo_camera,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        SocialCubit.get(context)
                                            .getCoverImage();
                                      })),
                            ),
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 69.0,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 65.0,
                              backgroundImage: profileImage == null
                                  ? NetworkImage(
                                      '${userModel.image}',
                                    )
                                  : FileImage(
                                      profileImage,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.photo_camera,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      SocialCubit.get(context)
                                          .getProfileImage();
                                    })),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${userModel.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if (SocialCubit.get(context).profileImage != null)
                        Expanded(
                          child: Column(
                            children: [
                              defaultButton(
                                function: () {
                                  SocialCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                text: 'upload profile ',
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      if (SocialCubit.get(context).coverImage != null)
                        Expanded(
                          child: Column(
                            children: [
                              defaultButton(
                                function: () {
                                  SocialCubit.get(context).uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                text: 'upload cover ',
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          ),
                        ),
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                defaultFormFiled(
                  controller: nameController,
                  type: TextInputType.name,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Name Must Not Be Empty';
                    }

                    return null;
                  },
                  label: 'Name',
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormFiled(
                  controller: phoneController,
                  type: TextInputType.phone,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Phone Number Must Not Be Empty';
                    }

                    return null;
                  },
                  label: 'Phone',
                  prefixIcon: Icons.phone,
                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormFiled(
                  controller: bioController,
                  type: TextInputType.name,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Bio Must Not Be Empty';
                    }
                    return null;
                  },
                  label: 'Bio',
                  prefixIcon: Icons.drive_file_rename_outline,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
