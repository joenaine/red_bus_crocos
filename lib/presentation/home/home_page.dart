import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _pAstana = LatLng(51.169392, 71.449074);
  static const LatLng _pAstanaAiland = LatLng(51.1480892, 71.4161325);
  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.route.tr(),
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(target: _pAstana, zoom: 13),
        markers: {
          const Marker(
              markerId: MarkerId('_currentLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: _pAstana),
          const Marker(
              markerId: MarkerId('_ailand'),
              icon: BitmapDescriptor.defaultMarker,
              position: _pAstanaAiland)
        },
      ),
    );
  }
}
