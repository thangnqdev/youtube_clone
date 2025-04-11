import 'package:flutter/material.dart';
import 'package:youtube/core/constants/assets/app_images.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

Widget buildVisibilityFullSize(BuildContext context) {
  return Material(
    color: context.isDarkMode ? AppColors.backgroundDarkMode : AppColors.backgroundLightMode,
    child: Container(
      child: buildBody(context),
    ),
  );
}

Widget buildBody(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Column(
      children: [
        Row(
          children: [
            const Text(
              'Title video',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              'View',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.subText,
              ),
            ),
            const Text(
              ' . ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.subText,
              ),
            ),
            Text(
              'Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.subText,
              ),
            ),
          ],
        ),
        SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionItem(
              icon: Icons.thumb_up_alt,
              label: '25.6K',
              onTap: () {
                print("Liked!");
              },
            ),
            _buildActionItem(
              icon: Icons.thumb_down_alt,
              label: '65',
              onTap: () {
                print("Disliked!");
              },
            ),
            _buildActionItem(
              icon: Icons.share_outlined,
              label: 'Share',
              onTap: () {
                print("Shared!");
              },
            ),
            _buildActionItem(
              icon: Icons.download_outlined,
              label: 'Download',
              onTap: () {
                print("Downloaded!");
              },
            ),
            _buildActionItem(
              icon: Icons.bookmark_border_outlined,
              label: 'Save',
              onTap: () {
                print("Saved!");
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFFCECECE), width: 0.5),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(AppImages.logoSplash, height: 36, width: 36),
              SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    'Voice of Books',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('289K subscibe'),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'SUBSCRIBE',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFF0000),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFFCECECE), width: 0.5),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        SizedBox(height: 12),
        const Row(
          children: [
            Text('Comments ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('149', style: TextStyle(color: AppColors.subText)),
            Spacer(),
            Icon(Icons.arrow_drop_down_sharp),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.account_circle_sharp),
            SizedBox(width: 13),
            Expanded(
              child: Text(
                'জাযাকাল্লাহ ভাইয়া আপনার এই মেহনত আল্লাহ কবুল করুক সম্ভব হলে প্রতিদিন ১টা করে porbo দিয়েন',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildActionItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}
