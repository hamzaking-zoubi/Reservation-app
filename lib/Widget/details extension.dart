import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DetailExtension extends StatelessWidget {

  final id;
  final title;
  final location;
  final cost;
  final rate;
  final type;
  DetailExtension({
    required this.id,
    required this.title,
    required this.rate,
    required this.type,
    required this.location,
    required this.cost,
  });


  static const _BOOKMARK_ICON = 'assets/icons/home_screen/bp_bookmark_icon.svg';
  static const _LOCATION_ICON = 'assets/icons/home_screen/bp_location_icon.svg';
  static const _STAR_ICON = 'assets/icons/home_screen/bp_star_icon.svg';

  //final List<ServiceTag> _listAmenitiesTags = ExampleData().getAmenitiesTags();

  @override
  Widget build(BuildContext context) {
    final _dtlTypeTextStyle =
    Theme.of(context).textTheme.subtitle2!.copyWith(color: kTagHotelColor);

    final _dtlTitleTextStyle = Theme.of(context).textTheme.headline2;
    final _dtlSubTitleTextStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w500);
    final _dtlSub1TextStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w600);
    final _dtlBody1TextStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.normal);

    return Padding(
      padding: PAD_SYM_H20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Text( '${type}',
                    style: _dtlTypeTextStyle),
                Spacer(),
                SvgPicture.asset(
                  _BOOKMARK_ICON,
                  height: 20,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
          SIZED_BOX_H12,
          Text('${title}', style: _dtlTitleTextStyle),
          SIZED_BOX_H12,
          Row(
            children: [
              SvgPicture.asset(_LOCATION_ICON, height: 20),
              SIZED_BOX_W06,
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '${location}', style: _dtlSub1TextStyle),
                 //   TextSpan(text: ' km', style: _dtlBody1TextStyle)
                  ])),
              SIZED_BOX_W20,
              SvgPicture.asset(_STAR_ICON, height: 20),
              SIZED_BOX_W06,
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '5', style: _dtlSub1TextStyle),
                    /*TextSpan(
                        text:
                        ' (${NumberFormat("#,###").format(hotel.reviewers)} Reviews)',
                        style: _dtlBody1TextStyle)*/
                  ])),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 20, 12),
              child: Text(DTL_SAMPLE_DESCRIPT_TEXT,
                  style: _dtlSub1TextStyle.copyWith(
                      height: 1.5,
                      color: kSubTextColor,
                      fontWeight: FontWeight.normal)),
            ),
            Text(DTL_AMENITY_TEXT, style: _dtlSubTitleTextStyle),
            /*Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _listAmenitiesTags
                      .map((tag) => ButtonServiceTag(
                    name: tag.name,
                    iconUrl: tag.iconUrl,
                    color: kBackgroundLightColor,
                    radius: 8,
                    size: 42,
                    fontSize: 12,
                  ))
                      .toList()),
            ),*/
          ])
        ],
      ),
    );
  }
}
