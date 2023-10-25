import 'package:flutter/material.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/user_profile_widgets.dart';

class MessengerTile extends StatelessWidget {
  final String pictureURL;
  final String firstName;
  final String lastName;
  final bool isMuted;
  final String lastInteraction;
  final bool isActive;
  const MessengerTile({
    super.key,
    required this.pictureURL,
    required this.firstName,
    required this.lastName,
    required this.isMuted,
    required this.lastInteraction,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                UserProfileThumbnail(
                    isActive: isActive,
                    raduis: 55,
                    userPicture: pictureURL,
                    onPressed: () {}),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName + lastName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      lastInteraction,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                isMuted ? const Icon(Icons.notifications_off) : Container()
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class MessengerUser extends StatelessWidget {
  final String pictureURL;
  final String firstName;
  final bool isActive;
  const MessengerUser({
    super.key,
    required this.pictureURL,
    required this.firstName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserProfileThumbnail(
                isActive: isActive,
                raduis: 55,
                userPicture: pictureURL,
                onPressed: () {}),
            const SizedBox(
              height: 5,
            ),
            Text(
              firstName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
