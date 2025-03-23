import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:ssoma_app/widgets/my_drawer_widet.dart';

class PantallaListaIncidente extends StatefulWidget {
  const PantallaListaIncidente({super.key});

  @override
  State<PantallaListaIncidente> createState() => _PantallaListaIncidenteState();
}

class _PantallaListaIncidenteState extends State<PantallaListaIncidente>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Estado de los Formularios ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              height: 32,
              width: 24,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Text("Abiertos")),
            Tab(child: Text("Cerrados")),
            Tab(child: Text("En Proceso")),
          ],
        ),
      ),
      drawer: MyDrawerWidet(),
      body: Center(child: Column()),
    );
  }
}
