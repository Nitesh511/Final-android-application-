import 'package:electronic_accessories_app/screens/Home/constraint.dart';
import 'package:flutter_svg/svg.dart';

getSvgIcon(icon) {
  return SvgPicture.asset(icon_path + icon);
}

getImage(image) {
  return image_path + image;
}

getImageNetwork(url) {
  return url;
}

getHeight(width, [String ratio = "16:9"]) {
  var split = ratio.split(":");
  var wr = double.parse(split[0]);
  var hr = double.parse(split[1]);
  return (width / wr) * hr;
}
