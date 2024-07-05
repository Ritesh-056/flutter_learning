import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiInterfaceScreen extends StatefulWidget {
  const KhaltiInterfaceScreen({super.key});

  @override
  State<KhaltiInterfaceScreen> createState() => _KhaltiInterfaceScreenState();
}

class _KhaltiInterfaceScreenState extends State<KhaltiInterfaceScreen> {
  late PaymentConfig config;

  @override
  void initState() {
    super.initState();

    config = PaymentConfig(
      amount: 10000, // Amount should be in paisa
      productIdentity: 'dell-g5-g5510-2021',
      productName: 'Dell G5 G5510 2021',
      productUrl: 'https://www.khalti.com/#/bazaar',
      additionalData: {
        'vendor': 'Khalti Bazaar',
      },
      mobile:
          '9800000001', // Not mandatory; can be used to fill mobile number field
      mobileReadOnly:
          true, // Not mandatory; makes the mobile field not editable
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: KhaltiButton(
          config: config,
          preferences: const [
            PaymentPreference.khalti,
          ],
          onSuccess: (successModel) {
            print("On payment send success: ${successModel.toString()}");
          },
          onFailure: (failureModel) {
            print("On payment failure: ${failureModel.toString()}");
          },
          onCancel: () {
            print("On payment mode cancelled");
          },
        ),
      ),
    );
  }
}
