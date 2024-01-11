import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:provider/provider.dart';

import '../../components/custom_label_text_form_field.dart';
import '../../components/custom_text.dart';
import '../../constants/app_constants.dart';
import '../../providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    nameController.text = context.read<UserProvider>().fullName;
    emailController.text = context.read<UserProvider>().email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomNunitoText(
          text: 'Profile details',
          fontWeight: FontWeight.w600,
          textSize: 16,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FullScreenWidget(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.contain),
                        ),
                      ),
                      width: 75.0,
                      height: 75.0,
                      imageUrl: context.read<UserProvider>().userImage,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              k20VerticalSpacing,
              CustomLabelInputText(
                label: "Name ",
                controller: nameController,
                obscureText: false,
                keyboardType: TextInputType.name,
                inputAction: TextInputAction.next,
              ),
              k20VerticalSpacing,
              CustomLabelInputText(
                label: "Email",
                controller: emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                enabled: false,
              ),
              k20VerticalSpacing,
              k20VerticalSpacing,
              Button(onPressed: (){}, text: 'Update Profile', block: true, color: kPrimaryColour,)
            ],
          ),
        ),
      ),
    );
  }
}
