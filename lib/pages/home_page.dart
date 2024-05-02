import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  HTTPService? _http;

  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HTTPService>();
  }

  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectedCoinDropdown(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropdown() {
    List<String> _coins = ["bitcoin", "ethereum", "tether"];
    List<DropdownMenuItem<String>> _items = _coins
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: 
                
              const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
        .toList();
    return DropdownButton(
      value: _coins.first,
      items: _items,
      onChanged: (_value) {},
      dropdownColor: Color.fromARGB(255, 88, 93, 233),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.blueGrey,
      ),
      underline: Container(),
    );
  }
}
