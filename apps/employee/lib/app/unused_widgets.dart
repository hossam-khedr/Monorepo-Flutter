// CustomAppBar(
// onBackPressed: context.read<RootCubit>().handleBackPressed,
// showAction: context.read<RootCubit>().shouldShowAction(),
// title: context.read<RootCubit>().getTitle(state.ccurrentIndex),
// action: context.read<RootCubit>().getActionWidget(
// onLeaveRequest: () => NavigationHelper.pushNamed(
// context,
// EmployeeRoute.createLeave,
// ),
// ),
// ),



// BuildNavigator(
// index: 0,
// navigatorKeys: state.navigatorKeys,
// child: HomeScreen(
// onAudience: () =>
// context.read<RootCubit>().selectedIndex(1),
// onProfile: () =>
// context.read<RootCubit>().selectedIndex(5),
// onHolidays: () =>
// context.read<RootCubit>().selectedIndex(2),
// onPassword: () => NavigationHelper.pushNamed(
// context,
// EmployeeRoute.changePassword,
// ),
// ),
// ),
// BuildNavigator(
// index: 1,
// navigatorKeys: state.navigatorKeys,
// child: AttendanceScreen(),
// ),
// BuildNavigator(
// index: 2,
// navigatorKeys: state.navigatorKeys,
// child: LeavesScreen(),
// ),
// BuildNavigator(
// index: 3,
// navigatorKeys: state.navigatorKeys,
// child: ChatsScreen(
// onChatRome: () => NavigationHelper.pushNamed(
// context,
// EmployeeRoute.chatRome,
// ),
// ),
// ),
// BuildNavigator(
// index: 4,
// navigatorKeys: state.navigatorKeys,
// child: ProfileScreen(
// onUpdate: () {},
// onPassword: () => NavigationHelper.pushNamed(
// context,
// EmployeeRoute.changePassword,
// ),
// onLogout: () => context.read<RootCubit>().logout(),
// ),
// ),


//BottomNavigationBar(
//   currentIndex: state.ccurrentIndex,
//   onTap: (index) {
//     context.read<RootCubit>().selectedIndex(index);
//   },
//   items: [
//     BottomNavigationBarItem(
//       icon: Icon(AppIcons.home),
//       label: AppStrings.home,
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(AppIcons.time),
//       label: AppStrings.audience,
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(AppIcons.calendar),
//       label: AppStrings.holidays,
//     ),
//
//     BottomNavigationBarItem(
//       icon: Icon(AppIcons.chat),
//       label: AppStrings.chats,
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(AppIcons.person),
//       label: AppStrings.profile,
//     ),
//   ],
// ),