import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/const/icons_image.dart';
import '../../../../view_model/course/usermodel_controller.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          AppIconConverter.fromAsset(
            AppIcons.handWave,
            height: 40,
            // width: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    'Hello ${controller.user.value.name}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Text(
                'Be the best version of yourself',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      // actions: <Widget>[
      //   InkWell(
      //     child: SvgPicture.asset(AppIcons.notification),
      //     onTap: () {
      //       // Handle notification button press
      //     },
      //   ),
      //   SizedBox(
      //     width: MediaQuery.of(context).size.height * 0.021,
      //   )
      // ],
    );
  }
}
