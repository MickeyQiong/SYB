import 'package:leshua/style/app_size.dart';

class HttpConfig {
  //static String baseUrl = 'https://www.vstarchain.com/api';
  static String baseUrl = 'http://test.vstarchain.com/api';
  // h5正式环境
  //static String webViewUrl = 'http://vant.vstarchain.com';
  static String webViewUrl = 'https://qrcodetest.vstarchain.com';



  static int timeOut = 30000;
  static String appId = 'syb_shb_${SizeFit.isIOS ? 'ios' : 'android'}';

  /// 发送登录短信接口
  static String sendLoginCode = '/vsc-cloud-center/merchantuser/sendLoginCode';
  /// 发送注册验证码
  static String sendRegisterCode = '/vsc-cloud-center/merchantuser/sendRegisterCode';
  /// 发送重置验证码
  static String sendResetPasswordCode = '/vsc-cloud-center/merchantuser/sendResetPasswordCode';
  /// 校验注册验证码(成功结果:{code: 200, data: a96b6044acb626ffa202dfb811e55680, message: 校验成功})
  static String checkRegisterCode = '/vsc-cloud-center/merchantuser/checkRegisterCode';
  /// 校验重置验证码
  static String checkResetPassword = '/vsc-cloud-center/merchantuser/checkResetPasswordCode';
  /// 注册
  static String register = '/vsc-cloud-center/merchantuser/register';
  /// 重置密码
  static String resetPassword = '/vsc-cloud-center/merchantuser/resetPassword';
  /// 密码登录
  static String loginWithPassword = '/vsc-cloud-center/merchantuser/login';
  /// 短信登录接口
  static String loginWithCode = '/vsc-cloud-center/merchantuser/loginBySmsCode';
  /// 注销用户
  static String cancelUser = '/vsc-cloud-center/merchantuser/cancelUser';
  /// 修改密码
  static String updatePassword = '/vsc-cloud-center/merchantuser/password/update';
  /// 查询可用商户信息
  static String getMerchant = '/vsc-merchant/merchantOperater4App/queryUseMerchant';
  /// 根据用户id查询商户信息,判断是否需要立即开通,还是继续填写
  static String getMerchantDetail = '/vsc-merchant/merchantOperater4App/findByUserId';

  /// 终端信息核查，判断是否需要意愿核身,根据needCheck字段确认是否意愿核身，
  /// 如果false则直接调用终端绑定，否则获取checkUrl跳转到微信进行意愿核身
  static String check = '/vsc-merchant/merchantOperater4App/termBindCheck';
  /// 意愿核身结果查询接口
  static String check1 = '/vsc-merchant/merchantOperater4App/wishAppletQuery';
  /// 终端绑定接口
  static String snBind = '/vsc-merchant/merchantOperater4App/termBind';
  /// 终端列表
  static String snList = '/vsc-data-center/terminal/findByMerCode';
  /// 商户当日交易金额
  static String totalAmount = '/vsc-data-center/order/sumOrderAmtByMerCode';

  static String loginPath = '/vsc-cloud-center/login4Phone';
  static String getPolicyList = '/vsc-product-center/policy/pages'; //获取我的政策分页数据
}