import 'package:BillBook/presentaion/homeScreen/subscriptionScreen/provider/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_image_view.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String? selectedDays = '90 DAYS';
  String dropdownValue = '0 Accounts';
  var selectedPlan;

  @override
  void initState() {
    super.initState();
    Provider.of<SubscriptionProvider>(context, listen: false).billListData();
  }

  final List<Map<String, String>> features = [
    {
      'title': 'Quotations',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/QuotationIcon.png',
    },
    {
      'title': 'Vehicle Condition',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/CarConditionIcon.png',
    },
    {
      'title': 'Lorry Receipt (LR)',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/LR-BiltyIcon.png',
    },
    {
      'title': 'Bill',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/billIcon.png',
    },
    {
      'title': 'Proforma Invoice',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/Proforma_invoiceIcon.png',
    },
    {
      'title': 'Packing List',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/PackingListIcon.png',
    },
    {
      'title': 'Survey List',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/surveyListIcon.png',
    },
    {
      'title': 'Money Receipt',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/moneyRecieptIcon.png',
    },
    {
      'title': 'Payment Voucher',
      'desc': 'Generate/Save/Share Unlimited',
      'imagePath': 'assets/images/paymentVoucher.png',
    },
    {
      'title': 'NOC Letter',
      'desc': 'Generate & Share',
      'imagePath': 'assets/images/NOCIcon.png',
    },
    {
      'title': 'Fov-Scf Form',
      'desc': 'Generate & Share',
      'imagePath': 'assets/images/fovFormIcon.png',
    },
    {
      'title': 'Tws Form',
      'desc': 'Generate & Share',
      'imagePath': 'assets/images/twsFormIcon.png',
    },
  ];

 /* void _showPlanDialog(sub, String planDays, String price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selected Plan"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Plan: $planDays"),
            Text("Price: $price"),
            Text("Admin Accounts: ${sub.adminAccount ?? 0}"),
            Text("Staff Accounts: ${sub.staffAccount ?? 0}"),
            Text("Plan ID: ${sub.sId ?? "N/A"}"), // ✅ show selected ID
          ],
        ),
        actions: [
          Row(
            children: [
              SizedBox(
                height: 60,
                child:
                InkWell(
                  onTap: () async {
                    if (selectedPlan == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Please select a subscription plan')),
                      );
                      return;
                    }

                    await provider.submitSubscription(
                      planId: selectedPlan.sId ?? "",
                      name: selectedPlan.name ?? "",
                      durationDays:
                      selectedPlan.durationDays ?? 0,
                      price: selectedPlan.price ?? 0,
                      adminAccount:
                      selectedPlan.adminAccount ?? 0,
                      staffAccount:
                      selectedPlan.staffAccount ?? 0,
                      startDate: DateTime.now()
                          .toString()
                          .split(" ")[0],
                      endDate: DateTime.now()
                          .add(Duration(
                          days:
                          selectedPlan.durationDays ?? 0))
                          .toString()
                          .split(" ")[0],
                      isActive: selectedPlan.isActive ?? false,
                      paymentStatus: "Pending",
                    );

                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Subscription submitted successfully!')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: provider.isLoading
                          ? Colors.grey
                          : Colors.blue,
                    ),
                    child: provider.isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      'Submit Subscription',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        ],
      ),
    );
  }*/
  void _showPlanDialog(sub, String planDays, String price) {
    final provider = Provider.of<SubscriptionProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: const Text("Selected Plan")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Completed the payment :',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(" $price",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  color: Colors.red
                ),),
              ],
            ),
            Row(
              children: [
                Text('Seleted subricbse plan ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('Platinum',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),),
              ],
            ),
            Row(
              children: [
                Text('For ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text('$planDays',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),),
              ],
            ),


          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Subscribe Button
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (selectedPlan == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                            Text('Please select a subscription plan')),
                      );
                      return;
                    }

                    await provider.submitSubscription(
                      planId: selectedPlan.sId ?? "",
                      name: selectedPlan.name ?? "",
                      durationDays: selectedPlan.durationDays ?? 0,
                      price: selectedPlan.price ?? 0,
                      adminAccount: selectedPlan.adminAccount ?? 0,
                      staffAccount: selectedPlan.staffAccount ?? 0,
                      startDate: DateTime.now().toString().split(" ")[0],
                      endDate: DateTime.now()
                          .add(Duration(days: selectedPlan.durationDays ?? 0))
                          .toString()
                          .split(" ")[0],
                      isActive: selectedPlan.isActive ?? false,
                      paymentStatus: "Pending",
                    );

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text('Subscription submitted successfully!')),
                    );

                    Navigator.pop(context); // close dialog after subscription
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: provider.isLoading ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: provider.isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : Text(
                      'Pay $price',
                     // 'Subscribe',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Cancel Button
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context), // close dialog
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Subscription'),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          /*  Container(
              padding: EdgeInsets.only(bottom: screenWidth * 0.03),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: Image.asset(
                      'assets/images/subscriptionPreImage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Choose Your Subscription',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Subscription Plans
                  ...?provider.subscriptionList?.data?.map((sub) {
                    final int duration = sub.durationDays ?? 0;
                    final String planDays = '$duration DAYS';
                    final String price = '₹${sub.price}/-';

                    final bool isSelected = selectedPlan == sub;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedDays = planDays;
                          selectedPlan = sub;
                        });

                        // Show pop message (dialog)
                        _showPlanDialog(sub, planDays, price);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blueAccent : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            planDays,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'PAY $price',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: isSelected ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),*/
            Container(
              padding: EdgeInsets.only(bottom: screenWidth * 0.03),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: Image.asset(
                      'assets/images/subscriptionPreImage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Choose Your Subscription',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Subscription Plans
                  ...?provider.subscriptionList?.data?.map((sub) {
                    final int duration = sub.durationDays ?? 0;
                    final String planDays = '$duration DAYS';
                    final String price = '₹${sub.price}/-';

                    final Color cardColor = duration == 90
                        ? const Color(0xFFACD7F6)
                        : duration == 180
                        ? const Color(0xFFFFDFA2)
                        : const Color(0xFFA8FFA8);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedDays = planDays;
                          selectedPlan = sub;
                        });
                        _showPlanDialog(sub, planDays, price);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: ListTile(
                          leading: Radio<String>(
                            value: planDays,
                            groupValue: selectedDays,
                            onChanged: (value) {
                              setState(() {
                                selectedDays = value;
                                selectedPlan = sub;
                              });
                              _showPlanDialog(sub, planDays, price);
                            },
                          ),
                          title: Text(planDays,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.04)),
                          subtitle: Text('PAY $price',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.035)),
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(height: screenHeight * 0.02),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenHeight * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              items: [
                                '0 Accounts',
                                '1 Account',
                                '2 Accounts',
                                '3 Accounts'
                              ]
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize:
                                        screenWidth * 0.035)),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Why Choose BillBook',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: Colors.white,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return ListTile(
                    leading: CustomImageView(
                      height: screenHeight * 0.05,
                      width: screenHeight * 0.05,
                      imagePath: feature['imagePath'] ?? '',
                    ),
                    title: Text(feature['title']!,
                        style:
                        TextStyle(fontSize: screenWidth * 0.035)),
                    subtitle: Text(feature['desc']!,
                        style:
                        TextStyle(fontSize: screenWidth * 0.03)),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
          ],
        ),
      ),
    );
  }
}
