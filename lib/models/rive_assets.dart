import 'package:rive/rive.dart';

class RiveAssets{
  final String artBoard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAssets(this.src, {required this.artBoard, required this.stateMachineName,  required this.title,  this.input});

  set setInput(SMIBool status){
    input = status;
  }


}
List<RiveAssets> bottomNavs = [
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "TIMER", stateMachineName: "TIMER_Interactivity", title: "Timer"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "BELL", stateMachineName: "BELL_Interactivity", title: "Bell"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "USER", stateMachineName: "USER_Interactivity", title: "User"),
];

List<RiveAssets> sideMenus = [
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "LIKE/STAR", stateMachineName: "STAR_Interactivity", title: "Favorites"),
  RiveAssets("assets/RiveAssets/icons.riv", artBoard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Help"),
];

List<RiveAssets> sideMenu2 = [
  RiveAssets(
    "assets/RiveAssets/icons.riv",
    artBoard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAssets(
    "assets/RiveAssets/icons.riv",
    artBoard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
  ),
];