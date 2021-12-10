import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../network/local/cache_helper/cach_helper.dart';


Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  double radius = 5.0,
  Color background = Colors.blue,
  bool isUpperCase = true,
  @required Function function,
  @required String text,
}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

Widget defaultFormFiled({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  Function onSubmit,
  Function onChange,
  Function onTap,
  @required String label,
  @required IconData prefixIcon,
  IconData suffixIcon,
  bool isPassword = false,
  Function suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcon,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
        ),
      ),
    );

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );


void showToast({
  @required String msg,
  @required Color color,
})=> Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0);

void singOut(context,Widget screen)=> CacheHelper.removeData(key: 'token').then((value) {
  if (value) {
    navigateAndFinish(context,screen );
  }
});


Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
})=> AppBar(
  leading:IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios,),
  ) ,
  titleSpacing: 5.0,
  title: Text(title),
  actions: actions,
);
