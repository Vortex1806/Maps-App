import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          children: [
            FlatButton.icon(icon: Icon(Icons.location_on),label: Text('Current Location') ,onPressed: (){}, textColor: Theme.of(context).primaryColor,),
            FlatButton.icon(icon: Icon(Icons.map),label: Text('Select On Map') ,onPressed: (){}, textColor: Theme.of(context).primaryColor,)
          ],
        ),
      ],
    );
  }
}
