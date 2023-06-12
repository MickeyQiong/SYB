
import 'package:leshua/style/app_size.dart';

extension DoubleFit on double {
  double get rpx {
    return SizeFit.setRpx(this);
  }

  double get px {
    return SizeFit.setPx(this);
  }
}


extension IntFit on int {
  double get rpx {
    return SizeFit.setRpx(toDouble());
  }

  double get px {
    return SizeFit.setPx(toDouble());
  }
}