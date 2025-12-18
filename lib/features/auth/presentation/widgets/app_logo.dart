import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key, this.width, this.height,
  });
  final  double? width;
  final  double? height;


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logoSvg, width: width ?? 100, height: height,);
  }
}