import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/app_export.dart';
import '../../utils/utils.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import '../home_tab_container_page/home_tab_container_page.dart';
import '../updates_page/updates_page.dart';
import 'provider/updates_tab_container_provider.dart';

// ignore_for_file: must_be_immutable
class UpdatesTabContainerPage extends StatefulWidget {
  const UpdatesTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  UpdatesTabContainerPageState createState() => UpdatesTabContainerPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdatesTabContainerProvider(),
      child: UpdatesTabContainerPage(),
    );
  }
}

class UpdatesTabContainerPageState extends State<UpdatesTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UpdatesTabContainerProvider>(context, listen: false)
          .getUpdates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: SizeUtils.width,
              child: Consumer<UpdatesTabContainerProvider>(
                  builder: (context, provider, child) {
                print("Consumer");
                print(provider.bulletin_respo.data.toString());
                print(provider.bulletin_respo.data?.events?.length);
                List<Widget>? tabViewChildren = [];
                List<Widget>? tabItem = [];
                tabItem = provider.bulletin_respo.data?.events?.map((data) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Tab(
                      child: Text(data.type ?? ""),
                    ),
                  );
                }).toList();

                tabViewChildren =
                    provider.bulletin_respo.data?.events?.map((data) {
                  return UpdatesPage(data.list);
                }).toList();

                tabviewController = TabController(
                    length: provider.bulletin_respo.data?.events?.length ?? 0,
                    vsync: this);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.v),
                    Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text(
                        "Calender",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 5.v),
                          _buildCalendar(context),
                          _buildTabview(context, tabItem),
                          _buildTabBarView(context, tabViewChildren),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            Selector<UpdatesTabContainerProvider, bool>(
              selector: (context, provider) => provider.isLoading,
              builder: (context, value, child) {
                return value ? CircularLoader() : SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_updates".tr,
        margin: EdgeInsets.only(left: 25.h),
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      // _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  /// Section Widget
  Widget _buildCalendar2(BuildContext context) {
    return Consumer<UpdatesTabContainerProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 386.v,
          width: 368.h,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.single,
              firstDate: DateTime(DateTime.now().year - 5),
              lastDate: DateTime(DateTime.now().year + 5),
              selectedDayHighlightColor: Color(0XFFFAA33A),
              centerAlignModePicker: true,
              firstDayOfWeek: 1,
              controlsHeight: 35.2,
              weekdayLabelTextStyle: TextStyle(
                color: appTheme.blueGray300,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
              selectedDayTextStyle: TextStyle(
                color: Color(0XFF000000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              controlsTextStyle: TextStyle(
                color: appTheme.blueGray900,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
              dayTextStyle: TextStyle(
                color: appTheme.blueGray300,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              disabledDayTextStyle: TextStyle(
                color: appTheme.blueGray300,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
              dayBorderRadius: BorderRadius.circular(
                7.h,
              ),
            ),
            value: provider.selectedDatesFromCalendar1 ?? [],
            onValueChanged: (dates) {
              provider.selectedDates(dates);
              provider.selectedDatesFromCalendar1 = dates;
            },
          ),
        );
      },
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return Consumer<UpdatesTabContainerProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 386.v,
          width: 368.h,

          child: TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            // eventLoader: provider.getEvents(),
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              provider.selectedDate(selectedDay);
            },
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),

          // child: CalendarDatePicker2(
          //   config: CalendarDatePicker2Config(
          //     calendarType: CalendarDatePicker2Type.single,
          //     firstDate: DateTime(DateTime.now().year - 5),
          //     lastDate: DateTime(DateTime.now().year + 5),
          //     selectedDayHighlightColor: Color(0XFFFAA33A),
          //     centerAlignModePicker: true,
          //     firstDayOfWeek: 1,
          //     controlsHeight: 35.2,
          //     weekdayLabelTextStyle: TextStyle(
          //       color: appTheme.blueGray300,
          //       fontFamily: 'Manrope',
          //       fontWeight: FontWeight.w400,
          //     ),
          //     selectedDayTextStyle: TextStyle(
          //       color: Color(0XFF000000),
          //       fontFamily: 'Poppins',
          //       fontWeight: FontWeight.w400,
          //     ),
          //     controlsTextStyle: TextStyle(
          //       color: appTheme.blueGray900,
          //       fontFamily: 'Manrope',
          //       fontWeight: FontWeight.w500,
          //     ),
          //     dayTextStyle: TextStyle(
          //       color: appTheme.blueGray300,
          //       fontFamily: 'Poppins',
          //       fontWeight: FontWeight.w400,
          //     ),
          //     disabledDayTextStyle: TextStyle(
          //       color: appTheme.blueGray300,
          //       fontFamily: 'Poppins',
          //       fontWeight: FontWeight.w400,
          //     ),
          //     weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
          //     dayBorderRadius: BorderRadius.circular(
          //       7.h,
          //     ),
          //   ),
          //   value: provider.selectedDatesFromCalendar1 ?? [],
          //   onValueChanged: (dates) {
          //     provider.selectedDates(dates);
          //     provider.selectedDatesFromCalendar1 = dates;
          //   },
          // ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context, List<Widget>? tabItem) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(color: Colors.white),
      // decoration: CurvedDecoration(color: Colors.white),
      child: TabBar(
          controller: tabviewController,
          isScrollable: true,
          labelColor: appTheme.whiteA70001,
          unselectedLabelColor: theme.colorScheme.secondaryContainer,
          unselectedLabelStyle: TextStyle(
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          indicatorPadding: EdgeInsets.only(
              left: 0.0.h, right: 1.0.h, top: 3.0.h, bottom: 3.0.h),
          indicator: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(
              18.h,
            ),
          ),
          tabs: tabItem ?? []),
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context, List<Widget>? tabViewChildren) {
    return SizedBox(
      height: 267.v,
      child: TabBarView(
        controller: tabviewController,
        children: tabViewChildren ?? [],
      ),
    );
  }
}
