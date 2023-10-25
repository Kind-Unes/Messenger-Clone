import 'package:flutter/material.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';

class UserFullName extends StatelessWidget {
  const UserFullName({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.onPressed,
  });

  final String firstName;
  final String lastName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Text(
          "$firstName $lastName",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class UserProfileThumbnail extends StatelessWidget {
  const UserProfileThumbnail({
    super.key,
    required this.raduis,
    required this.userPicture,
    required this.onPressed,
    required this.isActive,
  });
  final bool isActive;
  final double raduis;
  final String userPicture;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              height: raduis,
              width: raduis,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border:
                    Border.all(color: const Color.fromARGB(255, 115, 114, 114)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                  userPicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 40,
          child: OnlineStatus(isActive: isActive),
        )
      ],
    );
  }
}

class OnlineStatus extends StatelessWidget {
  final bool isActive;
  const OnlineStatus({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(500),
                color: MyColors.activeStatus),
          )
        : Container();
  }
}
