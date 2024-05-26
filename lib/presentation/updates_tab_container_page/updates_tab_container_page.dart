import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/presentation/widgets/tab_item_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/app_export.dart';
import '../../utils/utils.dart';
import '../../values/constants.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            width: SizeUtils.width,
            child: Consumer<UpdatesTabContainerProvider>(
                builder: (context, provider, child) {
              print("Consumer");

              print(provider.bulletin_respo.data?.events?.length);
              List<Widget>? tabViewChildren = [];
              List<Widget>? tabItem = [];
              tabItem = provider.bulletin_respo.data?.events?.map((data) {
                return TabItemWidget(data.type ?? "");
              }).toList();

              tabViewChildren =
                  provider.bulletin_respo.data?.events?.map((data) {
                print("data.type");
                print(data.type);
                return UpdatesPage(data.list, data.type);
              }).toList();

              tabviewController = TabController(
                  length: provider.bulletin_respo.data?.events?.length ?? 0,
                  vsync: this);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Text(
                      "Calender",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  // SingleChildScrollView(
                  //   child:
                  Column(
                    children: [
                      SizedBox(height: 5.v),
                      _buildCalendar(context),
                      _buildTabview(context, tabItem),
                      _buildTabBarViews(context, tabViewChildren),
                    ],
                  ),
                  // ),
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

  CalendarStyle buildCalendarStyle() {
    return CalendarStyle(
      cellPadding: EdgeInsets.zero,
      isTodayHighlighted: true,
      markerSize: 8,
      defaultTextStyle: TextStyle(color: Colors.black),
      weekNumberTextStyle: TextStyle(color: Colors.black),
      weekendTextStyle: TextStyle(color: Colors.black),
      cellMargin: const EdgeInsets.all(8),
      canMarkersOverflow: false,
      disabledDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      rowDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      outsideDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      weekendDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      markerDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          color: Constants.colors[0], // Color of the border
          width: 2, // Width of the border
        ),
      ),
      holidayDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      todayDecoration: BoxDecoration(
        color: Constants.colors[1],
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      defaultDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      rangeStartDecoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      selectedDecoration: BoxDecoration(
        color: Colors.yellow,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.colors[4],
              Constants.colors[3],
            ]),
        // shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return Consumer<UpdatesTabContainerProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
              color: appTheme.whiteA70001,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: appTheme.black900.withOpacity(0.03),
                ),
              ],
            ),
            child: SizedBox(
              child: TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle:
                        TextStyle(color: Colors.black, fontSize: 18)),
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: provider.getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (selectedDay, focusedDay) {
                  provider.selectedDate(selectedDay);
                },
                calendarStyle: buildCalendarStyle(),
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
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context, List<Widget>? tabItem) {
    if (tabItem == null) {
      return SizedBox();
    }
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
  Widget _buildTabBarViews(
      BuildContext context, List<Widget>? tabViewChildren) {
    return SizedBox(
      height: 1000.v,
      child: TabBarView(
        controller: tabviewController,
        children: tabViewChildren ?? [],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context, List<Widget>? tabViewChildren) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tabViewChildren?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // tabController.animateTo(index);
          },
          child: Container(
            width:
                MediaQuery.of(context).size.width, // Full width of the screen
            child: tabViewChildren?[index],
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3.0,
                  // color:tabController.index == index ? Colors.blue : Colors.transparent,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
