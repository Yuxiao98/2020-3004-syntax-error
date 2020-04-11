import 'package:flutter/material.dart';
import 'package:sports_fields_rental/FieldInformation.dart';
import 'package:sports_fields_rental/FieldType.dart';
import 'package:sports_fields_rental/Field.dart';
import 'package:sports_fields_rental/FieldDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sports_fields_rental/Model/User.dart';

class ItemList extends StatelessWidget {
  List<Field> fields = List<Field>();
  List<Field> filteredFields = List<Field>();
  List<FieldType> selectedList;
  User currentUser;
  ItemList(List<FieldType> selected, User current) {

    selectedList = selected;
    currentUser = current;

  }

  @override
  Widget build(BuildContext context) {

    return new StreamBuilder(
        stream: Firestore.instance.collection('fields').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return  SpinKitCubeGrid(
              color: Colors.white,
              size: 80.0,
            );
          }
          for(var f in snapshot.data.documents){
            fields.add(new Field(FieldType.values[f.data['type']],f.data['imageUrl'],f.data['name'],f.data['description'],new FieldInformation(f.data['address'], f.data['phoneNumber'])));
          }
          for(var i = 0; i < fields.length; i++){
            if(selectedList.contains(fields.elementAt(i).type)){
              filteredFields.add(fields.elementAt(i));
            }
          }
          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredFields.length,
              itemBuilder: /*1*/ (context, i) {

                return _buildRow(filteredFields.elementAt(i), context);
              }
          );
        }
    );


  }

  Widget _buildRow(Field field, BuildContext context){
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/'+ field.imageUrl),
      ),
      title: Text(field.name),
      subtitle: Text(field.description),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FieldDetails(field, currentUser)),
        );
      },
    );
  }
}
