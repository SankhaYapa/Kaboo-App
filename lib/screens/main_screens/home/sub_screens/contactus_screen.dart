import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';
import 'package:kaboo_app/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ContactProvider>(
          builder: (context, value, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 4,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CustomIcon(iconName: "logo2.png"),
                          CustomText(text: "Need some help?"),
                          SizedBox(
                            height: 30,
                          ),
                          CustomText(
                            text: "Email us on :\nexample@kaboo.com",
                            align: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: size.width / 1.8,
                          child: CustomImage(
                            name: 'contact.jpg',
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: 'Full Name',
                        name: 'Full Name',
                        controller: value.nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hint: 'Email',
                        name: 'Email',
                        controller: value.emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomText(text: "Country of residence :"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CountryCodePicker(
                        showCountryOnly: true,
                        initialSelection: "Sri Lanka",
                        showOnlyCountryWhenClosed: true,
                        alignLeft: true,
                        onChanged: (x) {
                          value.setCountry(x.name.toString());
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLines: 8, //or null
                        controller: value.messageController,
                        decoration: InputDecoration(
                          hintText: "Message",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          value.sendForm();
                          print(value.nameController.text);
                          print(value.emailController.text);
                          print(value.country);
                          print(value.messageController.text);
                        },
                        child: Text("Send"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
