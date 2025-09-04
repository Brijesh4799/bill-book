import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_dropDownWithInputText.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/lr_bill_provider.dart';

class LrBlityScreen extends StatefulWidget {
  final String mobileNumber;
  const LrBlityScreen({Key? key, required this.mobileNumber}) : super(key: key);
  //const LrBlityScreen({super.key});
  @override
  _LrBlityScreenState createState() => _LrBlityScreenState();
}

class _LrBlityScreenState extends State<LrBlityScreen> {
// LR (Lorry Receipt) Controllers
  final TextEditingController lrNumberController = TextEditingController();
  final TextEditingController lrDateController = TextEditingController();
  final TextEditingController pickFromController = TextEditingController();
  final TextEditingController deliverToController = TextEditingController();
  final TextEditingController vehicleNoController = TextEditingController();

// Risk Type Dropdown
  String? riskTypeSelected;
  final List<String> riskTypeOptions = ['At Owner Risk', 'At Carrier Risk'];
// Move From Controllers
  final TextEditingController consignorNameController = TextEditingController();
  final TextEditingController consignorPhoneController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();
  final TextEditingController stateCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

// truck Controllers
  final TextEditingController trukNumberController = TextEditingController();
  final TextEditingController truckMoveFromController = TextEditingController();
  final TextEditingController truckMoveToController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController driversPhoneController = TextEditingController();
  final TextEditingController driversLicenceController = TextEditingController();

// Move To Controllers
  final TextEditingController consigneeNameController = TextEditingController();
  final TextEditingController consigneePhoneController = TextEditingController();
  final TextEditingController toGstinController = TextEditingController();
//  final TextEditingController toStateCodeController = TextEditingController();
  final TextEditingController toCountryController = TextEditingController(text:'India');
  final TextEditingController toStateController = TextEditingController(text:'New Delhi');
  final TextEditingController toCityController = TextEditingController();
  final TextEditingController toPincodeController = TextEditingController();
  final TextEditingController toAddressController = TextEditingController();

// Package Details Controllers
  final TextEditingController packageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController receiveConditionController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

// Dropdown variable for Package Details
  String? weightUnitOption;

// Payment Details Controllers
  final TextEditingController freightToBeBilledController = TextEditingController();
  final TextEditingController freightPaidController = TextEditingController();
  final TextEditingController freightToPayController = TextEditingController();
  // TextEditingControllers
  final TextEditingController totalBasicController = TextEditingController();
  final TextEditingController totalLoadingChargeController = TextEditingController();
  final TextEditingController unLoadingChargeController = TextEditingController();
  final TextEditingController stChargeController = TextEditingController();
  final TextEditingController otherChargeController = TextEditingController();
  final TextEditingController lrCnChargeController = TextEditingController();

// Dropdown selections
  String? selectedGst;
  String? selectedGstPaid;


// Material Insurance Controllers
  final TextEditingController insuranceCompanyController = TextEditingController();
  final TextEditingController policyNumberController = TextEditingController();
  final TextEditingController insuranceDateController = TextEditingController();
  final TextEditingController insuredAmountController = TextEditingController();
  final TextEditingController insuranceRiskController = TextEditingController();

// Dropdown variable for Material Insurance
  String? selectedMaterialInsurance;

// Demurrage Charge Controllers & Variables
  final TextEditingController demurrageChargeController = TextEditingController();
  String? demurrageChargeOption;
  String? demurrageApplicableAfterOption;

  // invoice & ebil
  // Material Insurance Controllers
  final TextEditingController goodsValueController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController ewayBillNumberController = TextEditingController();
  final TextEditingController ewayBillGenerateDateController = TextEditingController();
  final TextEditingController ewayBillExpireDateController = TextEditingController();
  final TextEditingController ewayBillExtendedPeriodController = TextEditingController();

  void _SaveAllValues() {
    // LR (Lorry Receipt)
    print('--- LR (Lorry Receipt) ---');
    print('LR Number: ${lrNumberController.text}');
    print('LR Date: ${lrDateController.text}');
    print('Pick From: ${pickFromController.text}');
    print('Deliver To: ${deliverToController.text}');
    print('Vehicle No: ${vehicleNoController.text}');
    print('Risk Type: ${riskTypeSelected ?? ''}');

    // Move From
    print('--- Move From ---');
    print('Consignor Name: ${consignorNameController.text}');
    print('Consignor Phone: ${consignorPhoneController.text}');
    print('GSTIN: ${gstinController.text}');
    print('State Code: ${stateCodeController.text}');
    print('Country: ${countryController.text}');
    print('State: ${stateController.text}');
    print('City: ${cityController.text}');
    print('Pincode: ${pincodeController.text}');
    print('Address: ${addressController.text}');

    // Move To
    print('--- Move To ---');
    print('Consignee Name: ${consigneeNameController.text}');
    print('Consignee Phone: ${consigneePhoneController.text}');
    print('GSTIN: ${toGstinController.text}');
    //print('State Code: ${toStateCodeController.text}');
    print('Country: ${toCountryController.text}');
    print('State: ${toStateController.text}');
    print('City: ${toCityController.text}');
    print('Pincode: ${toPincodeController.text}');
    print('Address: ${toAddressController.text}');

    // Package Details
    print('--- Package Details ---');
    print('Package: ${packageController.text}');
    print('Description: ${descriptionController.text}');
    print('Total Weight: ${totalWeightController.text} ${weightUnitOption ?? ''}');
    print('Receive Package Condition: ${receiveConditionController.text}');
    print('Remark: ${remarkController.text}');

    // Payment Details
    print('--- Payment Details ---');
    print('Freight To Be Billed: ${freightToBeBilledController.text}');
    print('Freight Paid: ${freightPaidController.text}');
    print('Freight To Pay: ${freightToPayController.text}');

    // Material Insurance
    print('--- Material Insurance ---');
    print('Material Insurance: ${selectedMaterialInsurance ?? ''}');
    print('Insurance Company: ${insuranceCompanyController.text}');
    print('Policy Number: ${policyNumberController.text}');
    print('Insurance Date: ${insuranceDateController.text}');
    print('Insured Amount: ${insuredAmountController.text}');
    print('Insurance Risk: ${insuranceRiskController.text}');

    // Demurrage Charge
    print('--- Demurrage Charge ---');
    print('Demurrage Charge: ${demurrageChargeController.text} ${demurrageChargeOption ?? ''}');
    print('Demurrage Charge Applicable After: ${demurrageApplicableAfterOption ?? ''}');
  }
  @override
  void initState() {
    super.initState();
    String todayDate = HelperFunctions().formatDateToDDMMYYYY(DateTime.now());
    lrDateController.text = todayDate;
    insuranceDateController.text = todayDate;
    invoiceDateController.text = todayDate;
    ewayBillGenerateDateController.text = todayDate;
    ewayBillExpireDateController.text = todayDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'LR/ Bilty'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _lrBlityDetailsTile(),
            _buildTruckFromTile(),
            _buildMoveFromTile(),
            _buildMoveToTile(),
            _buildPackageDetailsTile(),
            _buildPaymentDetailsTile(),
            _buildMaterialInsuranceTile(),
            _buildDemurrageChargeTile(),
            _buildInvoiceAndEwayBillTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<LRBillProvider>(
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
                    await provider.lrbill(
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
                    'Save LR',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }

  Widget _lrBlityDetailsTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'LR /Bilty Details (बिल्टी का विवरण)',
            children: [
              inputTextFields(
                label: 'LR Number (बिल्टी  संख्या)',
                inputType: TextInputType.number,
                textEditingController: provider.lrNumberController,
              ),
              inputTextFields(
                label: 'LR Date (बिल्टी  तिथि)',
                textEditingController: provider.lrDateController,
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
                        provider.lrDateController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),

              Consumer<LRBillProvider>(
                builder: (context, provider, child) {
                  return customDropdown(
                    label: 'Risk Type (किसका रिस्क है)',
                    items: riskTypeOptions,
                    selectedItem: provider.riskTypeSelected,
                    onChanged: (value) {
                      provider.setRiskType(value);
                    },
                    val: provider.validateRiskType, controller: null,
                  );
                },
              ),
            ],
          );
        }
    );
  }

  Widget _buildTruckFromTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Truck/Vehicle Details (गाड़ी का विवरण)',
            children: [
              inputTextFields(
                label: 'TRUCK/VEHICLE NO. (गाड़ी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.trukNumberController,
              ),
              inputTextFields(
                label: 'MOVE FROM (जहां से सामान उठाना है)',
                textEditingController: provider.truckMoveFromController,
              ),
              inputTextFields(
                label: 'MOVE TO (जहां सामान भेजना है)',
                textEditingController: provider.truckMoveToController,
              ),
              Text('Driver\'s Details',style: TextStyle(fontWeight: FontWeight.bold),),
              inputTextFields(
                label: 'DRIVER NAME',
                textEditingController: provider.driverNameController,
              ),
              inputTextFields(
                label: 'DRIVER\'S MOBILE NO.',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.driversPhoneController,
              ),
              inputTextFields(
                label: 'DRIVER\'S LICENCE NO.',
                textEditingController: provider.driversLicenceController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildMoveFromTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Consignor/Move From (जहाँ से सामान जाएगा)',
            children: [
              inputTextFields(
                label: 'CONSIGNORE NAME (भेजने वाले का नाम)',
                textEditingController: provider.consignorNameController,
              ),
              inputTextFields(
                label: 'CONSIGNORE PHONE (भेजने वाले का फोन)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.consignorPhoneController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      inputType: TextInputType.number,
                      label: 'GSTIN (जीएसटी नंबर)',
                      textEditingController: provider.gstinController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE CODE (राज्य कोड)',
                      inputType: TextInputType.number,
                      textEditingController: provider.stateCodeController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.countryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.stateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.cityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिनकोड)',
                      maxLength: 6,
                      textEditingController: provider.pincodeController,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                textEditingController: provider.addressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildMoveToTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Consignee / Move To (जहाँ सामान जाना है)',
            children: [
              inputTextFields(
                label: 'CONSIGNEE NAME (सामान लेने वाले का नाम)',
                textEditingController: provider.consigneeNameController,
              ),
              inputTextFields(
                inputType: TextInputType.phone,
                maxLength: 10,
                label: 'CONSIGNEE PHONE (सामान लेने वाले का फोन)',
                textEditingController: provider.consigneePhoneController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'GSTIN (जीएसटी नंबर)',
                      inputType: TextInputType.number,
                      textEditingController: provider.toGstinController,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.toCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.toStateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.toCityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिनकोड)',
                      textEditingController: provider.toPincodeController,
                      inputType: TextInputType.number,
                      maxLength: 6
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.toAddressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildPackageDetailsTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Package Details(पैकेज का विवरण )',
            children: [
              inputTextFields(
                label: 'No. Of PACKAGE (पैकेज की संख्या)',
                inputType: TextInputType.number,
                textEditingController: provider.packageController,
              ),
              inputTextFields(
                label: 'DESCRIPTION (पैकेज का विवरण)',
                textEditingController: provider.descriptionController,
              ),
              Consumer<LRBillProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.weightUnitOption,
                    onDropdownChanged: (val) {
                      provider.setWeightUnitOption(val);
                    },
                    dropdownItems: ['KG', 'MT', 'LTR', 'CBM', 'FTL', 'None'],
                    controller: provider.totalWeightController,
                    hintText: 'Enter Value',
                    dropDownhint: 'Select Unit',
                    labelText: 'ACTUAL WEIGHT (वास्तविक वजन)',
                  );
                },
              ),

              DropdownWithInputField(
                dropdownValue: weightUnitOption,
                onDropdownChanged: (val) {
                  setState(() {
                    weightUnitOption = val;
                  });
                },
                dropdownItems: ['KG', 'MT', 'LTR','CBM','FTL','None'],
                controller: provider.totalWeightController,
                hintText: 'Enter Value',
                dropDownhint: 'Select Unit',
                labelText: 'CHARGED WEIGHT (चार्ज किया गया वजन)',
              ),


              inputTextFields(
                label: 'RECEIVE PACKAGE CONDITION (प्राप्त माल की स्थिति)',
                textEditingController: provider.receiveConditionController,
              ),
              inputTextFields(
                label: 'REMARK (अन्य विवरण)',
                maxLines: 3,
                textEditingController: provider.remarkController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildPaymentDetailsTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Payment Details(भुगतान विवरण)',
            children: [
              inputTextFields(
                label: 'FREIGHT TO BE BILLED (कुल भाड़ा)',
                inputType: TextInputType.number,
                textEditingController: provider.freightToBeBilledController,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'FREIGHT PAID (प्राप्त भाड़ा)',
                      inputType: TextInputType.number,
                      textEditingController: provider.freightPaidController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      inputType: TextInputType.number,
                      label: 'FREIGHT TO PAY (बकाया भाड़ा)',
                      textEditingController: provider.freightToPayController,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'TOTAL BASIC FREIGHT',
                      inputType: TextInputType.number,
                      textEditingController: provider.totalBasicController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'LOADING CHARGE',
                      inputType: TextInputType.number,
                      textEditingController: provider.totalLoadingChargeController,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'UNLOADING CHARGE',
                      inputType: TextInputType.number,
                      textEditingController: provider.unLoadingChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'S.T CHARGE',
                      inputType: TextInputType.number,
                      textEditingController:provider.stChargeController,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'OTHER CHARGES',
                      inputType: TextInputType.number,
                      textEditingController: provider.otherChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'LR/CN CHARGE',
                      inputType: TextInputType.number,
                      textEditingController:provider.lrCnChargeController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:
                    customDropdown(
                      label: 'GST%',
                      items: ['0%','5%','12%','18%','28'],
                      selectedItem: selectedGst,
                      onChanged: (value) {
                        setState(() {
                          selectedGst = value;
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Consumer<LRBillProvider>(
                    builder: (context, provider, child) {
                      return Expanded(
                        flex: 2,
                        child: customDropdown(
                          label: 'GST PAID BY',
                          items: ['Consignee', 'Consignor', 'Transporter', 'Exempted'],
                          selectedItem: provider.gstPaidBy,
                          onChanged: (value) {
                            provider.setGstPaidBy(value);
                          },
                          val: provider.validateGstPaidBy, controller: null,
                        ),
                      );
                    },
                  )

                ],
              ),
            ],
          );
        }
    );
  }

  Widget _buildMaterialInsuranceTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Material Insurance (सामान का बीमा)',
            children: [

              Consumer<LRBillProvider>(
                builder: (context, provider, child) {
                  return customDropdown(
                    label: 'MATERIAL INSURANCE (क्या सामान का बीमा है?)',
                    items: ['Insured', 'Not Insured'],
                    selectedItem: provider.materialInsurance,
                    onChanged: (value) {
                      provider.setMaterialInsurance(value);
                    },
                    val: provider.validateMaterialInsurance, controller: null,
                  );
                },
              ),


              inputTextFields(
                label: 'INSURANCE COMPANY (बीमा कंपनी)',
                textEditingController: provider.insuranceCompanyController,
              ),
              inputTextFields(
                label: 'POLICY NUMBER (पॉलिसी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.policyNumberController,
              ),
              inputTextFields(
                label: 'INSURANCE DATE (बीमा तिथि)',
                textEditingController: provider.insuranceDateController,
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
                        provider.insuranceDateController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'INSURED AMOUNT (बीमा राशि)',
                      inputType: TextInputType.number,
                      textEditingController: provider.insuredAmountController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'INSURANCE RISK (बीमा जोखिम)',
                      textEditingController: provider.insuranceRiskController,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }

  Widget _buildDemurrageChargeTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Demurrage Charge',
            children: [
              Consumer<LRBillProvider>(
                builder: (context, provider, child) {
                  return DropdownWithInputField(
                    dropdownValue: provider.demurrageChargeOption,
                    onDropdownChanged: (val) {
                      provider.setDemurrageChargeOption(val);
                    },
                    dropdownItems: ['Per Day', 'Per Week'],
                    controller: provider.demurrageChargeController,
                    hintText: '500',
                    labelText: 'DEMURRAGE CHARGE (विलंब शुल्क)',
                  );
                },
              ),

              Consumer<LRBillProvider>(
                builder: (context, provider, child) {
                  return customDropdown(
                    label: 'DEMURRAGE CHARGE APPLICABLE AFTER (कितने समय बाद शुरू)',
                    items: [
                      '1 Hour',
                      '2 Hour',
                      '4 Hour',
                      '8 Hour',
                      '12 Hour',
                      '1 Day',
                      '2 Day',
                      '3 Day',
                      '4 Day',
                      'More Than 5 Day',
                    ],
                    selectedItem: provider.demurrageApplicableAfter,
                    onChanged: (value) {
                      provider.setDemurrageApplicableAfter(value);
                    },
                    val: provider.validateDemurrageApplicableAfter, controller: null,
                  );
                },
              )

            ],
          );
        }
    );
  }

  Widget _buildInvoiceAndEwayBillTile(){
    return Consumer<LRBillProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Invoice & E-Way Bill',
            children: [
              inputTextFields(
                label: 'Goods Value (सामान कीमत)',
                textEditingController: provider.goodsValueController,
              ),
              inputTextFields(
                label: 'Invoice/Bill Number (बिल नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.invoiceNumberController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'Invoice Date (बिल की तारीख)',
                      textEditingController: provider.invoiceDateController,
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
                              provider.invoiceDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Text('E-Way Bill Details',style: TextStyle(fontWeight: FontWeight.bold),),
              inputTextFields(
                inputType: TextInputType.number,
                label: 'E-Way Bill Number',
                textEditingController: provider.ewayBillNumberController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'E-Way Bill Generate Date',
                      textEditingController: provider.ewayBillGenerateDateController,
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
                              provider.ewayBillGenerateDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'E-Way Bill Expire Date',
                      textEditingController: provider.ewayBillExpireDateController,
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
                              provider.ewayBillExpireDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'E-Way Bill Extended Period',
                textEditingController: provider.ewayBillExtendedPeriodController,
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
