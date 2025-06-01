import 'package:hoteli/features/home/data/models/profile.dart';

class ProfileRepositories {
  Future<Profile> fetchuserprofile() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    return Profile(
        id: '16263646',
        name: 'Victus',
        email: 'arefmoosavi7813@gmail.com',
        avatarUrl: "assets/images/v4.png",
        phoneNumber: '09054505885',
        location: 'ایران - مشهد',
        bio: 'عاشق برنامه نویسی موبایل',
        bookings: 6,
        favorites: 3,
        notifications: 2);
  }
}
