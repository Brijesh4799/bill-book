import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_checkBox.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_dropDownWithInputText.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/bill_provider.dart';

class BillScreen extends StatefulWidget {
  final String mobileNumber;
  const BillScreen({Key? key, required this.mobileNumber}) : super(key: key);
  @override
  _BillScreen createState() => _BillScreen();
}

class _BillScreen extends State<BillScreen> {

  //pre invoice detail

  final TextEditingController preInvoiceNumberController = TextEditingController(text: '0001');
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController deliveryDateController = TextEditingController();
  final TextEditingController movingPathController = TextEditingController();
  final TextEditingController shipmentTypeController = TextEditingController();
  final TextEditingController movingPathRemarkController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController lrNumberController = TextEditingController();



// Text controllers for consignee details
  final TextEditingController consigneeNameController = TextEditingController();
  final TextEditingController consigneePhoneController = TextEditingController();
  final TextEditingController consigneeGstinController = TextEditingController();
  final TextEditingController consigneeCountryController = TextEditingController(text: 'India');
  final TextEditingController consigneeStateController = TextEditingController();
  final TextEditingController consigneeCityController = TextEditingController();
  final TextEditingController consigneePincodeController = TextEditingController();
  final TextEditingController consigneeAddressController = TextEditingController();
   TextEditingController gstController = TextEditingController();

// Charge option dropdowns
  String? packingChargeOption;
  String? unpackingChargeOption;
  String? loadingChargeOption;
  String? unloadingChargeOption;
  String? packingMaterialChargeOption;
  String? surchargeOption;
  String? gstOption;
  String? gstPercentageOption;
  String? gstTypeOption;
  String? reverseChargeOption;
  String? gstPaidByOption;

// Text controllers
  final TextEditingController freightChargeController = TextEditingController();
  final TextEditingController advancePaidController = TextEditingController();
  final TextEditingController packingChargeController = TextEditingController();
  final TextEditingController unpackingChargeController = TextEditingController();
  final TextEditingController loadingChargeController = TextEditingController();
  final TextEditingController unloadingChargeController = TextEditingController();
  final TextEditingController packingMaterialChargeController = TextEditingController();
  final TextEditingController storageChargeController = TextEditingController();
  final TextEditingController carBikeTptController = TextEditingController();
  final TextEditingController miscChargesController = TextEditingController();
  final TextEditingController otherChargesController = TextEditingController();
  final TextEditingController stChargeController = TextEditingController();
  final TextEditingController octrioTaxController = TextEditingController();
  final TextEditingController surchargeController = TextEditingController();
  final TextEditingController paymentRemarkController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

// Dropdown option lists
  final List<String> chargeOptions = [
    'Included in Freight', 'Excluded', 'Not Applicable'
  ];
  final List<String> surchargeOptions = [
    'Not Applicable', 'Applicable'
  ];
  final List<String> gstShowHideOptions = [
    'GST Charge Show In Bill', 'GST Charge Hide In Bill'
  ];
  final List<String> gstPercentageOptions = [
    '0%', '5%', '12%', '18%', '28%'
  ];
  final List<String> gstTypeOptions = [
    'CGST/SGST', 'IGST'
  ];
  final List<String> reverseChargeOptions = [
    'NO', 'YES'
  ];
  final List<String> gstPaidByOptions = [
    'Consignee', 'Consignor'
  ];
// Text controllers for billing details
  final TextEditingController billToNameController = TextEditingController();
  final TextEditingController billToPhoneController = TextEditingController();
  final TextEditingController billToGstinController = TextEditingController();
  final TextEditingController billToCountryController = TextEditingController(text: 'India');
  final TextEditingController billToStateController = TextEditingController();
  final TextEditingController billToCityController = TextEditingController();
  final TextEditingController billToPincodeController = TextEditingController();
  final TextEditingController billToAddressController = TextEditingController();

// Package Details Controllers
  final TextEditingController packageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController receiveConditionController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

// Dropdown variable for Package Details
  String? weightUnitOption;

  String? selectedInsuranceType;
  String? selectedInsuranceChargePercent;
  String? selectedGstValue;
  final TextEditingController declarationGoodsValueController = TextEditingController();

  String? selectedVehicleInsuranceType;
  String? selectedVehicleInsuranceChargePercent;
  String? selectedVehicleGstValue;
  final TextEditingController declarationVehicleValueController = TextEditingController();

  // Consignor Details Controllers
  final TextEditingController consignorNameController = TextEditingController();
  final TextEditingController consignorPhoneController = TextEditingController();
  final TextEditingController consignorGstinController = TextEditingController();
  final TextEditingController consignorCountryController = TextEditingController();
  final TextEditingController consignorStateController = TextEditingController();
  final TextEditingController consignorCityController = TextEditingController();
  final TextEditingController consignorPincodeController = TextEditingController();
  final TextEditingController consignorAddressController = TextEditingController();
  final TextEditingController packingGstShow = TextEditingController();

// Checkbox state for "Same as Billing"
  bool isConsignorSameAsBilling = true;

  void _SaveAllValues() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'BILL (TAX INVOICE)'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInvoiceBillDetails(),
            _buildBillingDetailsTile(),
            _buildConsignorDetailsTile(),
            _buildConsigneeDetailsTile(),
            _buildPackageDetailsTile(),
            _buildPaymentDetailsTile(),
            _buildInsuranceDetailsTile(),
            _buildVehicleInsuranceDetailsTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<BillProvider>(
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
                    await provider.billprovider(
                      mobileNumber: widget.mobileNumber,
                      context: context,
                    );
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
                    'Save Bill',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }


  Widget _buildInvoiceBillDetails(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Invoice/ Bill Details (बिल का विवरण)',
            children: [
              inputTextFields(
                label: 'INVOICE/BILL NUMBER* (बिल नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.preInvoiceNumberController,
              ),
              inputTextFields(
                label: 'COMPANY NAME OF PARTY (कंपनी नाम - जिसे कोटेशन चाहिए)',
                textEditingController: provider.companyNameController,
              ),
              inputTextFields(
                inputType: TextInputType.number,
                label: 'LR NUMBER (बिल्टी नंबर)',
                textEditingController: provider.lrNumberController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'INVOICE DATE (बिल की तारीख)',
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
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'DELIVERY DATE (सामान मिलने की तारीख)',
                      textEditingController: provider.deliveryDateController,
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
                              provider.deliveryDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'MOVING PATH (मूविंग रास्ता)',
                      textEditingController: provider.movingPathController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'TYPE OF SHIPMENT (शिपमेंट का प्रकार)',
                      textEditingController: provider.shipmentTypeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVING PATH REMARK (मूविंग रास्ता टिप्पणी)',
                textEditingController: provider.movingPathRemarkController,
              ),
              inputTextFields(
                label: 'MOVE FROM (जहां से सामान जाएगा)',
                textEditingController: provider.moveFromController,
              ),
              inputTextFields(
                label: 'MOVE TO (जहां सामान जाना है)',
                textEditingController: provider.moveToController,
              ),
              inputTextFields(
                label: 'VEHICLE NUMBER (गाड़ी नंबर)',
                textEditingController: provider.vehicleNumberController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildBillingDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Billing Details (बिलिंग प्राप्तकर्ता का विवरण)',
            children: [
              inputTextFields(
                label: 'BILL TO NAME* (बिल प्राप्तकर्ता का नाम)',
                textEditingController: provider.billToNameController,
              ),
              inputTextFields(
                inputType: TextInputType.phone,
                maxLength: 10,
                label: 'BILL TO PHONE* (बिल प्राप्तकर्ता का फोन)',
                textEditingController: provider.billToPhoneController,
              ),
              inputTextFields(
                inputType: TextInputType.number,
                label: 'GSTIN (जीएसटी नंबर)',
                textEditingController: provider.billToGstinController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.billToCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.billToStateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.billToCityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिन कोड)',
                      inputType: TextInputType.number,
                      maxLength: 6,
                      textEditingController: provider.billToPincodeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.billToAddressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildConsignorDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Consignor Details (सामान भेजने वाले का विवरण)',
            children: [
              customCheckbox(
                isChecked: isConsignorSameAsBilling,
                label: "CONSIGNO      R DETAILS SAME AS BILLING DETAILS",
                labelColor: Colors.green,
                onChanged: (bool? value) {
                  setState(() {
                    isConsignorSameAsBilling = value ?? false;
                  });
                },
              ),
              if (!isConsignorSameAsBilling) ...[
                inputTextFields(
                    label: 'CONSIGNOR NAME (भेजने वाले का नाम)',
                    textEditingController: provider.consignorNameController
                ),
                inputTextFields(
                    label: 'CONSIGNOR PHONE* (भेजने वाले का फोन)',
                    inputType: TextInputType.phone,
                    maxLength: 10,
                    textEditingController: provider.consignorPhoneController
                ),
                inputTextFields(
                  inputType: TextInputType.number,
                    label: 'GSTIN (जीएसटी नंबर)',
                    textEditingController: provider.consignorGstinController
                ),
                Row(
                  children: [
                    Expanded(child: inputTextFields(label: 'COUNTRY (देश)', textEditingController: provider.consignorCountryController)),
                    SizedBox(width: 10),
                    Expanded(child: inputTextFields(label: 'STATE (राज्य)', textEditingController: provider.consignorStateController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: inputTextFields(label: 'CITY (शहर)', textEditingController: provider.consignorCityController)),
                    SizedBox(width: 10),
                    Expanded(
                        child: inputTextFields(label: 'PINCODE (पिन कोड)',
                            inputType: TextInputType.number,
                            maxLength: 6,
                            textEditingController: provider.consignorPincodeController
                        )),
                  ],
                ),
                inputTextFields(
                  label: 'ADDRESS (पता)',
                  maxLines: 4,
                  textEditingController: provider.consignorAddressController,
                ),
              ],
            ],
          );
        }
    );
  }

  Widget _buildConsigneeDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Consignee Details (सामान लेने वाले का विवरण)',
            children: [
              inputTextFields(
                label: 'CONSIGNEE NAME (सामान लेने वाले का नाम)',
                textEditingController: provider.consigneeNameController,
              ),
              inputTextFields(
                label: 'CONSIGNEE PHONE (सामान लेने वाले का फोन)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.consigneePhoneController,
              ),
              inputTextFields(
                label: 'GSTIN (जीएसटी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.consigneeGstinController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'COUNTRY (देश)',
                      textEditingController: provider.consigneeCountryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'STATE (राज्य)',
                      textEditingController: provider.consigneeStateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'CITY (शहर)',
                      textEditingController: provider.consigneeCityController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'PINCODE (पिन कोड)',
                      inputType: TextInputType.number,
                      maxLength: 6,
                      textEditingController: provider.consigneePincodeController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'ADDRESS (पता)',
                maxLines: 3,
                textEditingController: provider.consigneeAddressController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildPackageDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return   _expansionTileWrapper(
            title: 'Package Details (पैकेज का विवरण)',
            children: [
              inputTextFields(
                label: 'PACKAGE (पैकेज)',
                textEditingController: provider.packageController,
              ),
              inputTextFields(
                label: 'DESCRIPTION (पैकेज का विवरण)',
                textEditingController: provider.descriptionController,
              ),
              DropdownWithInputField(
                dropdownValue: weightUnitOption,
                onDropdownChanged: (val) {
                  setState(() {
                    weightUnitOption = val;
                    provider.weightUnitController.text = val ?? ''; // Store dropdown value
                  });
                },
                dropdownItems: ['KG', 'Ton', 'Gram'],
                controller: provider.totalWeightController, // Input field controller
                hintText: 'Enter Value',
                dropDownhint: 'Select Unit',
                labelText: 'TOTAL WEIGHT (कुल वजन)',
              ),

              inputTextFields(
                label: 'HSN/SAC CODE',
                textEditingController: provider.receiveConditionController,
              ),
              inputTextFields(
                label: 'REMARK (टिप्पड़ी)',
                maxLines: 3,
                textEditingController: provider.remarkController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildPaymentDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return   _expansionTileWrapper(
            title: 'Payment Details (पेमेंट का विवरण)',
            children: [
              inputTextFields(
                label: 'FREIGHT CHARGE',
                hintText: '0',
                inputType: TextInputType.number,
                textEditingController: provider.freightChargeController,
              ),
              inputTextFields(
                label: 'ADVANCE PAID',
                hintText: '0',
                inputType: TextInputType.number,
                textEditingController: provider.advancePaidController,
              ),
              DropdownWithInputField(
                dropdownValue: packingChargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    packingChargeOption = val;
                    if (val == "Excluded") {
                      provider.packingChargeController.clear(); // clear the input if "Excluded"
                    } else {
                      provider.packingChargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: chargeOptions,
                controller: provider.packingChargeController,
                hintText: '0',
                labelText: 'PACKING CHARGE',
              ),
              DropdownWithInputField(
                dropdownValue: unpackingChargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    unpackingChargeOption = val;
                    if (val == "Excluded") {
                      provider.unpackingChargeController.clear(); // clear the input if "Excluded"
                    } else {
                      provider.unpackingChargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: chargeOptions,
                controller: provider.unpackingChargeController,
                hintText: '0',
                labelText: 'UN PACKING CHARGE',
              ),
              DropdownWithInputField(
                dropdownValue: loadingChargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    loadingChargeOption = val;

                    if (val == "Excluded") {
                      provider.loadingChargeController.clear(); // clear if "Excluded"
                    } else {
                      provider.loadingChargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: chargeOptions,
                controller: provider.loadingChargeController,
                hintText: '0',
                labelText: 'LOADING CHARGE',
              ),
              DropdownWithInputField(
                dropdownValue: unloadingChargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    unloadingChargeOption = val;
                    if (val == "Excluded") {
                      provider.unloadingChargeController.clear(); // clear if "Excluded"
                    } else {
                      provider.unloadingChargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: chargeOptions,
                controller: provider.unloadingChargeController,
                hintText: '0',
                labelText: 'UN LOADING CHARGE',
              ),
              DropdownWithInputField(
                dropdownValue: packingMaterialChargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    packingMaterialChargeOption = val;
                    if (val == "Excluded") {
                      provider.packingMaterialChargeController.clear(); // clear if "Excluded"
                    } else {
                      provider.packingMaterialChargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: chargeOptions,
                controller: provider.packingMaterialChargeController,
                hintText: '0',
                labelText: 'PACKING MATERIAL CHARGE',
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'STORAGE CHARGE',
                      hintText: '0',
                      textEditingController: provider.storageChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'CAR/BIKE TPT',
                      hintText: '0',
                      textEditingController: provider.carBikeTptController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'MISCELLANEOUS CHARGES',
                      hintText: '0',
                      textEditingController: provider.miscChargesController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'OTHER CHARGES',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.otherChargesController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'S.T. CHARGE',
                      hintText: '0',
                      inputType: TextInputType.number,
                      textEditingController: provider.stChargeController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'GREEN TAX',
                      hintText: '0',
                      textEditingController: provider.octrioTaxController,
                    ),
                  ),
                ],
              ),
              DropdownWithInputField(
                dropdownValue: surchargeOption,
                onDropdownChanged: (val) {
                  setState(() {
                    surchargeOption = val;
                    if (val == "Excluded") {
                      provider.surchargeController.clear(); // clear if "Excluded"
                    } else {
                      provider.surchargeController.text = val ?? ''; // fill with selected value
                    }
                  });
                },
                dropdownItems: surchargeOptions,
                controller: provider.surchargeController,
                hintText: '10%',
                labelText: 'SURCHARGE',
              ),
              customDropdown(
                label: 'GST SHOW/HIDE GST',
                items: gstShowHideOptions,
                selectedItem: gstOption,
                onChanged: (value) {
                  setState(() {
                    gstOption = value;
                    gstController.text = value ?? ''; // fill controller with selected value
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
                controller: provider.gstController, // assign controller
              ),

          Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'GST %',
                      items: gstPercentageOptions,
                      selectedItem: gstPercentageOption,
                      onChanged: (value) {
                        setState(() {
                          gstPercentageOption = value;
                          provider.gstPercentageController.text = value ?? ''; // fill controller with selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select GST %';
                        }
                        return null;
                      },
                      controller: provider.gstPercentageController, // assign controller
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: customDropdown(
                      label: 'GST TYPE',
                      items: gstTypeOptions,
                      selectedItem: gstTypeOption,
                      onChanged: (value) {
                        setState(() {
                          gstTypeOption = value;
                          provider.gstTypeController.text = value ?? ''; // update controller with selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select GST Type';
                        }
                        return null;
                      },
                      controller: provider.gstTypeController, // assign controller
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'REVERSE CHARGE',
                      items: reverseChargeOptions,
                      selectedItem: reverseChargeOption,
                      onChanged: (value) {
                        setState(() {
                          reverseChargeOption = value;
                          provider.reverseChargeController.text = value ?? ''; // update controller with selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select Reverse Charge option';
                        }
                        return null;
                      },
                      controller: provider.reverseChargeController, // assign controller
                    ),
                  ),

                  SizedBox(width: 10),
                  Expanded(
                    child: customDropdown(
                      label: 'GST PAID BY',
                      items: gstPaidByOptions,
                      selectedItem: gstPaidByOption,
                      onChanged: (value) {
                        setState(() {
                          gstPaidByOption = value;
                          provider.gstPaidByController.text = value ?? ''; // update controller with selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select who pays GST';
                        }
                        return null;
                      },
                      controller: provider.gstPaidByController, // assign controller
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'PAYMENT REMARK',
                textEditingController: provider.paymentRemarkController,
              ),
              inputTextFields(
                inputType: TextInputType.number,
                label: 'DISCOUNT (डिस्काउंट) - APPLICABLE ON SUB-TOTAL AMOUNT',
                textEditingController: provider.discountController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildInsuranceDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Insurance Details (इंश्योरेंस जानकारी)',
            children: [
              customDropdown(
                label: 'Insurance Type',
                items: ['Yes', 'Not Applicable'],
                selectedItem: selectedInsuranceType,
                onChanged: (value) {
                  setState(() {
                    selectedInsuranceType = value;
                    provider.insuranceTypeController.text = value ?? ''; // store selected value
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
                controller: provider.insuranceTypeController, // assign controller
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENT(%)',
                      items: ['Yes', 'No'],
                      selectedItem: selectedInsuranceChargePercent,
                      onChanged: (value) {
                        setState(() {
                          selectedInsuranceChargePercent = value;
                          provider.insuranceChargePercentController.text = value ?? ''; // store selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      controller: provider.insuranceChargePercentController, // assign controller
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: customDropdown(
                      label: 'GST%',
                      items: ['0', '1', '2', '3', '4', '5'],
                      selectedItem: selectedGstValue,
                      onChanged: (value) {
                        setState(() {
                          selectedGstValue = value;
                          provider.gstValueController.text = value ?? ''; // store selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      controller: provider.gstValueController, // assign controller
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'DECLARATION VALUE OF GOODS(if any)',
                textEditingController: provider.declarationGoodsValueController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildVehicleInsuranceDetailsTile(){
    return Consumer<BillProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Vehicle insurance Details (गाड़ी इंश्योरेंस जानकारी)',
            children: [
              customDropdown(
                label: 'Insurance Type',
                items: ['Yes', 'Not Applicable'],
                selectedItem: selectedVehicleInsuranceType,
                onChanged: (value) {
                  setState(() {
                    selectedVehicleInsuranceType = value;
                    provider.vehicleInsuranceTypeController.text = value ?? ''; // store selected value
                  });
                },
                val: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
                controller: provider.vehicleInsuranceTypeController, // assign controller
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: customDropdown(
                      label: 'INSURANCE CHARGE @PERCENT(%)',
                      items: ['Yes', 'No'],
                      selectedItem: selectedVehicleInsuranceChargePercent,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleInsuranceChargePercent = value;
                          provider.vehicleInsuranceChargePercentController.text = value ?? ''; // store selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      controller: provider.vehicleInsuranceChargePercentController, // assign controller
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: customDropdown(
                      label: 'GST%',
                      items: ['0', '1', '2', '3', '4', '5'],
                      selectedItem: selectedVehicleGstValue,
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleGstValue = value;
                          provider.vehicleGstValueController.text = value ?? ''; // store selected value
                        });
                      },
                      val: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      controller: provider.vehicleGstValueController, // assign controller
                    ),
                  ),
                ],
              ),
              inputTextFields(
                inputType: TextInputType.number,
                label: 'DECLARATION VALUE OF VEHICLE(if any)',
                textEditingController: provider.declarationVehicleValueController,
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
