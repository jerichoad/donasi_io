import 'package:flutter/material.dart';
import 'package:donasi_io/theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';


class AddCampaign extends StatefulWidget {

  @override
  _AddCampaignState createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  //File? imageinput;

  //File? imageProses;

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Campaign',
          style: primaryTextStyle.copyWith(
            fontWeight: bold
          ),
        ),
      );
    }

  /* void prosesFoto() {
    Future<Directory?> extDir = getExternalStorageDirectory();
    extDir.then((value) {
    String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = value!.path + '/${_timestamp()}.jpg';
    final String name= "Uploaded by: ${active_user}, on ${_timestamp()}";
    //final String filePath = value!.path + '/' + active_user + '${_timestamp()}.jpg';
    _imageProses = File(filePath);
    img.Image temp = img.readJpg(_image!.readAsBytesSync());
    img.Image temp2 = img.copyResize(temp, width: 480, height: 640);
    img.drawString(temp2, img.arial_24, 4, 4, name.toString(),
      color: img.getColor(250, 100, 100));
    setState(() {
      _imageProses!.writeAsBytesSync(img.writeJpg(temp2));
    });
    });
  }

    _imgGaleri() async {
    final picker = ImagePicker();
    final image = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 600,
      maxWidth: 600);
      setState(() {
        //_image = File(image!.path);
        //prosesFoto();
    });
  }

  _imgKamera() async {
    final picker = ImagePicker();
    final image =
      await picker.getImage(source: 
        ImageSource.camera, 
        imageQuality: 20
      );
    setState(() {
      imageinput = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
          color: Colors.white,
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                tileColor: Colors.white,
                leading: new Icon(Icons.photo_library),
                title: new Text('Galeri'),
                onTap: () {
                  _imgGaleri();
                  Navigator.of(context).pop();
                }
              ),
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Kamera'),
                onTap: () {
                  _imgKamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          ),
        );
      }
    );
  }*/

    Widget footer(){
      //NOTE: BUTTONS
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 54,
                child: TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: primaryColor
                  ),
                  child: Text(
                    "Create Donation",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Name Here',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget targetInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donation Target',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Target',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    /*Widget dropdownCategory(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: DropdownButton(
          value: dropdownvalue,
            icon: Icon(Icons.keyboard_arrow_down),
            items:items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items)
                  );
            }
            ).toList(),
          onChanged: (String newValue){
            setState(() {
              dropdownvalue = newValue;
            });
          },
        ),
      );
    }*/

  /*
    Widget inputimage(){
    return Padding(
      padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            _showPicker(context);
          }, child: 
          imageProses != null
            ? Image.file(imageProses!)
            : Image.network("http://ubaya.fun/blank.jpg"),
        )
      );
    }*/

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              children: [
                nameInput(),
                targetInput(),
                //dropdownCategory(),
              ],
            ),
          ),
          footer(),
        ],
      ),
    );
  }
}