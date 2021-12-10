part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}


class SocialGetUserLoadingState extends SocialState {}
class SocialGetUserSuccessState extends SocialState {}
class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState(this.error);
}


class SocialGetAllUserLoadingState extends SocialState {}
class SocialGetAllUserSuccessState extends SocialState {}
class SocialGetAllUserErrorState extends SocialState {
  final String error;

  SocialGetAllUserErrorState(this.error);
}


class SocialGetPostsLoadingState extends SocialState {}
class SocialGetPostsSuccessState extends SocialState {}
class SocialGetPostsErrorState extends SocialState {
  final String error;

  SocialGetPostsErrorState(this.error);
}


class SocialLikePostsSuccessState extends SocialState {}
class SocialLikePostsErrorState extends SocialState {
  final String error;

  SocialLikePostsErrorState(this.error);
}


class SocialCommentPostsSuccessState extends SocialState {}
class SocialCommentPostsErrorState extends SocialState {
  final String error;

  SocialCommentPostsErrorState(this.error);
}


class SocialChangeBottomNavState extends SocialState {}
class SocialPostBottomState extends SocialState {}


class SocialProfileImagePickedSuccessState extends SocialState {}
class SocialProfileImagePickedErrorState extends SocialState {}


class SocialCoverImagePickedSuccessState extends SocialState {}
class SocialCoverImagePickedErrorState extends SocialState {}


class SocialUploadCoverImageSuccessState extends SocialState {}
class SocialUploadCoverImageErrorState extends SocialState {}


class SocialUploadProfileImageSuccessState extends SocialState {}
class SocialUploadProfileImageErrorState extends SocialState {}


class SocialUserUpdateLoadingState extends SocialState {}
class SocialUserUpdateErrorState extends SocialState {}


class SocialCreatePostLoadingState extends SocialState {}
class SocialCreatePostSuccessState extends SocialState {}
class SocialCreatePostErrorState extends SocialState {
  final String error;

  SocialCreatePostErrorState(this.error);
}


class SocialPostImagePickedSuccessState extends SocialState {}
class SocialPostImagePickedErrorState extends SocialState {}


class SocialRemovePostImageState extends SocialState {}


class SocialSendMessageSuccessState extends SocialState {}
class SocialSendMessageErrorState extends SocialState {
  final String error;

  SocialSendMessageErrorState(this.error);
}
class SocialGetMessagesSuccessState extends SocialState {}
class SocialGetMessagesErrorState extends SocialState {
  final String error;

  SocialGetMessagesErrorState(this.error);
}
