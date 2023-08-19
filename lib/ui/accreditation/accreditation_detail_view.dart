import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/shared/widget/field_title_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../shared/widget/property_card.dart';

@RoutePage()
class AccreditationDetailView extends StatefulWidget {
  const AccreditationDetailView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccreditationDetailViewState();
}

class _AccreditationDetailViewState extends State<AccreditationDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConstants.instance.logo,
          height: context.height * 0.05,
          cacheHeight: 100,
        ),
      ),
      body: Container(
        padding: context.edgeNormal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  FieldTitleWidget(
                    title: "MIP Name",
                    backgroundColor: context.accreditationColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Accreditation 1",
                        style: context.textTheme.headlineMedium!
                            .copyWith(color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          splashRadius: 10,
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  FieldTitleWidget(
                    title: "MIP Description",
                    backgroundColor: context.accreditationColor,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, quis aliquam nisl nunc eu nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, quis aliquam nisl nunc eu nisl.",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              PropertyCard(
                  title: 'Engineers',
                  count: '10',
                  cardColor: context.engineerColor,
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
