import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../../core/widgets/custom_selector.dart';
import '../../home_controller.dart';
import '../provider/car_condition_provider.dart';

class CarConditionScreen extends StatefulWidget {
  final String mobileNumber;
  const CarConditionScreen({Key? key, required this.mobileNumber}) : super(key: key);
  //const CarConditionScreen({super.key});

  @override
  _CarConditionScreen createState() => _CarConditionScreen();
}

class _CarConditionScreen extends State<CarConditionScreen> {
  final TextEditingController vehicleConditionNumberController = TextEditingController();
  final TextEditingController lrNumberController = TextEditingController();
  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController partyPhoneController = TextEditingController();
  final TextEditingController partyEmailController = TextEditingController();
  final TextEditingController vehicleDateController = TextEditingController();
  final TextEditingController moveFromVehicleController = TextEditingController();
  final TextEditingController moveToVehicleController = TextEditingController();

  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleBrandNameController = TextEditingController();
  final TextEditingController vehicleValueController = TextEditingController();
  final TextEditingController insurancePolicyNoController = TextEditingController();
  final TextEditingController insuranceCompanyNameController = TextEditingController();
  final TextEditingController vehicleRegNoController = TextEditingController();
  final TextEditingController manufacturingYearController = TextEditingController();
  final TextEditingController vehicleColorController = TextEditingController();
  final TextEditingController vehicleKilometerController = TextEditingController();
  final TextEditingController chassisNoController = TextEditingController();
  final TextEditingController engineNoController = TextEditingController();

  final List<String> accessoriesList = [
    'STEPNEY',
    'WHEEL CAPS',
    'SIDE REAR VIEW MIRROR',
    'CAR RADIO/PLAYER',
    'AIR CONDITION',
    'LIGHTER',
    'DIGITAL WATCH',
    'SPEAKER',
    'TOOL KIT',
    'JACK',
    'WIPER ARMS & BLADES',
    'MUD FLAP',
    'FLOOR RUBBER CARPET',
    'FUEL (PETROL/LTR.)',
    'CAR COVER',
  ];

  final Map<String, String> selectedAccessories = {};

  final TextEditingController batteryNoController = TextEditingController();
  final TextEditingController tyreNoController = TextEditingController();
  final TextEditingController otherAccessoriesController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();


  final TextEditingController scratchesController = TextEditingController();
  final TextEditingController dentController = TextEditingController();
  final TextEditingController otherVisibleObservationController = TextEditingController();


  void _saveAllValues() {

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Car Condition'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVehicleConditionDetailsTile(),
            _buildVehicleDetailsTile(),
            _buildAccessoriesDetailsTile(),
            _buildScratchesDetailsTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<CarConditionProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: () async {
                    HelperFunctions helper = HelperFunctions();
                    bool isConnected = await helper.isConnected();

                    if (!isConnected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No internet connection')),
                      );
                      return;
                    }

                    // Call the provider's method
                    await provider.carconditionprovider(
                      mobileNumber: widget.mobileNumber,
                      context: context,
                    );

                    // Navigate to Home Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full width button
                    backgroundColor: Colors.blue, // Customize as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Vehicle Condition',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }



  Widget _buildVehicleConditionDetailsTile(){
    return Consumer<CarConditionProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Vehicle Condition details \n(वाहन की स्थिति का विवरण)',
            children: [
              inputTextFields(
                label: 'VEHICLE CONDITION NUMBER',
                inputType: TextInputType.number,
                textEditingController: provider.vehicleConditionNumberController,
              ),
              inputTextFields(
                label: 'LR NUMBER',
                inputType: TextInputType.number,
                textEditingController: provider.lrNumberController,
              ),
              inputTextFields(
                label: 'PARTY NAME* (व्यक्ति नाम - जिसे कोटेशन चाहिए)',
                textEditingController: provider.partyNameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'PARTY PHONE (फोन)',
                      inputType: TextInputType.phone,
                      maxLength: 10,
                      textEditingController: provider.partyPhoneController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'EMAIL (ईमेल)',
                      textEditingController: provider.partyEmailController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'DATE (तारीख)',
                textEditingController: provider.vehicleDateController,
                readOnly: true,
                suffix: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(5101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        provider.vehicleDateController.text =
                        "${pickedDate.day.toString().padLeft(2, '0')}/"
                            "${pickedDate.month.toString().padLeft(2, '0')}/"
                            "${pickedDate.year}";
                      });
                    }
                  },
                ),
              ),
              inputTextFields(
                label: 'MOVE FROM',
                textEditingController: provider.moveFromVehicleController,
              ),
              inputTextFields(
                label: 'MOVE TO',
                textEditingController: provider.moveToVehicleController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildVehicleDetailsTile(){
    return Consumer<CarConditionProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Vehicle Details \n(वाहन का विवरण)',
            children: [
              inputTextFields(
                label: 'VEHICLE TYPE',
                hintText: 'eg. Car/Bike/Other',
                textEditingController: provider.vehicleTypeController,
              ),
              inputTextFields(
                label: 'VEHICLE BRAND NAME',
                hintText: 'eg. Tata/Tiago',
                textEditingController: provider.vehicleBrandNameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: "VEHICLE'S VALUE (INR)",
                      inputType: TextInputType.number,
                      textEditingController: provider.vehicleValueController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      inputType: TextInputType.number,
                      label: 'INSURANCE POLICY NO.',
                      textEditingController: provider.insurancePolicyNoController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'INSURANCE COMPANY NAME',
                textEditingController: provider.insuranceCompanyNameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'VEHICLE REG. NO.',
                      hintText: 'eg. HR-16R-1240',
                      textEditingController: provider.vehicleRegNoController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'MANUFACTURING YEAR',
                      hintText: 'eg. 2020',
                      textEditingController: provider.manufacturingYearController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COLOUR',
                      hintText: 'eg. White',
                      textEditingController: provider.vehicleColorController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'VEHICLE KILOMETER (KM)',
                      hintText: "Check Vehicle's Meter",
                      textEditingController: provider.vehicleKilometerController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'CHASSIS NO.',
                textEditingController: provider.chassisNoController,
              ),
              inputTextFields(
                label: 'ENGINE NO.',
                textEditingController: provider.engineNoController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildAccessoriesDetailsTile(){
    return Consumer<CarConditionProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Accessories Details \n(वाहन के सामान का विवरण)',
            children: [

              inputTextFields(
                label: 'BATTERY NO.',
                inputType: TextInputType.number,
                textEditingController: provider.batteryNoController,
              ),
              inputTextFields(
                label: 'TYRE NO.',
                inputType: TextInputType.number,
                textEditingController: provider.tyreNoController,
              ),
              inputTextFields(
                label: 'ANY OTHER ACCESSORIES',
                textEditingController: provider.otherAccessoriesController,
                maxLines: 2,
              ),
              inputTextFields(
                label: 'ANY REMARK',
                textEditingController: provider.remarkController,
                maxLines: 2,
              ),
            ],
          );
        }
    );
  }


  Widget _buildScratchesDetailsTile(){
    return Consumer<CarConditionProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Dent/ Scratches Details \n(डेंट / खरोंच का विवरण)',
            children: [
              inputTextFields(
                label: 'SCRATCHES',
                textEditingController: provider.scratchesController,
              ),
              inputTextFields(
                label: 'DENT',
                textEditingController: provider.dentController,
              ),
              inputTextFields(
                label: 'ANY OTHER VISIBLE OBSERVATION',
                textEditingController: provider.otherVisibleObservationController,
                maxLines: 2,
              ),
            ],
          );
        }
    );
  }

  Widget _expansionTileWrapper({required String title, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        children: [Padding(padding: const EdgeInsets.all(12.0), child: Column(children: children))],
      ),
    );
  }
}
