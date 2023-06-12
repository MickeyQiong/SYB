class MyImage {

  static String assets(String path){
    return '$imagePath $path .png';
  }
  /// 本地图片根路径
  static const imagePath = 'assets/image/';
  static const homePath = 'assets/home/';

  static const myAvatar = '${imagePath}my_avatar.png';
  static const myInfo = '${imagePath}my_info.png';
  static const mySetting = '${imagePath}my_setting.png';
  static const iconNoticeNormal = '${imagePath}icon_notice_normal.png';
  static const iconNotice = '${imagePath}icon_notice.png';
  static const imageNotice = '${imagePath}image_notice.png';
  static const launchImage = '${imagePath}launch_image.png';
  static const iconSelected = '${imagePath}icon_selected.png';
  static const iconUnSelected = '${imagePath}icon_unselect.png';

  static const iconHomeTop = '${homePath}icon_home_top.png';
  static const iconHomeTopRight = '${homePath}icon_home_top_right.png';
  static const bgHomeTop = '${homePath}home_top_bg.png';
  static const bgBillTop = '${homePath}bill_top_bg.png';
  static const iconHomeNotice = '${homePath}icon_home_notice.png';
  static const iconDone = '${homePath}icon_done.png';
  static const iconScan = '${homePath}icon_scan.png';
  static const iconBindSn = '${homePath}icon_bind_sn.png';
  static const iconBindDate = '${homePath}icon_bind_date.png';
  static const iconHomeMenu1 = '${homePath}icon_home_menu1.png';
  static const iconHomeMenu2 = '${homePath}icon_home_menu2.png';
  static const homeBottomBg1 = '${homePath}home_bottom_bg1.png';
  static const homeBottomBg2 = '${homePath}home_bottom_bg2.png';
  static const iconHomeMenu3 = '${homePath}icon_home_menu3.png';
  static const iconHomeMenu4 = '${homePath}icon_home_menu4.png';
  static const iconHomeBottom1 = '${homePath}icon_home_bottom1.png';
  static const iconHomeBottom2 = '${homePath}icon_home_bottom2.png';
  static const homeBanner = '${homePath}home_banner.png';
}