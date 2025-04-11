import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/core/network/auth_service.dart';
import 'package:youtube/features/domain/entities/item_config_user.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/pages/home/pages/home_page.dart';
import 'package:youtube/features/presentations/pages/user/widget/item_config_user.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? _imageUrl;
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefGet = await SharedPreferences.getInstance();
    setState(() {
      _imageUrl = prefGet.getString('photoURL');
      _name = prefGet.getString('displayName');
      _email = prefGet.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            buildAppBar(context),
            buildTopBody(context),
            buildBody(context, getItemsConfig(context)),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text('Account', style: TextStyle(color: AppColors.news)),
      centerTitle: true,
    );
  }

  Widget buildTopBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFFE5E5E5), width: 1),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child:
                      _imageUrl != null
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(_imageUrl!),
                          )
                          : Icon(Icons.account_circle),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_name ?? 'username'),
                    Text(_email ?? 'email'),
                    GestureDetector(
                      onTap: () async {
                        await AuthService().SignInWithGoogle();
                        await _loadUserInfo();
                      },
                      child: Text(
                        'Manage Your Google Account',
                        style: TextStyle(color: AppColors.news),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<ItemConfigUser> items) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        if (index == 1) {
          return itemYoutubeStudio(context, items[index]);
        } else if (index == 10) {
          return GestureDetector(
            onTap: () {
              showConfirmDialog(context);
            },
            child: itemConfigLayout(context, items[index]),
          );
        } else {
          return itemConfigLayout(context, items[index]);
        }
      },
      itemCount: items.length,
    );
  }

  Widget itemConfigLayout(BuildContext context, ItemConfigUser item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [item.iconStart, SizedBox(width: 27), Text(item.title)],
        ),
      ),
    );
  }

  Widget itemYoutubeStudio(BuildContext context, ItemConfigUser item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            item.iconStart,
            SizedBox(width: 27),
            Text(item.title),
            Spacer(),
            SvgPicture.asset(
              context.isDarkMode
                  ? AppVectors.launchDarkMode
                  : AppVectors.launchLightMode,
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Xác nhận'),
            content: Text('Bạn có chắc chắn muốn đăng xuất ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  return;
                },
                child: Text('Không'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(true);
                  await AuthService().singOut();
                  await _loadUserInfo();
                },
                child: Text('Có'),
              ),
            ],
          ),
    );
  }
}
