import 'package:flutter/material.dart';
import 'pullover_scaffold.dart';
import 'styles.dart';
import 'model/meeting.dart';
import 'model/conversation.dart';

class TableHeaderText extends StatelessWidget {
  final String text;

  const TableHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 12,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: primaryColor),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                this.text,
                style: h6TextStyle,
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}

class TimeText extends StatelessWidget {
  final String text;

  const TimeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.access_time,
            size: 15,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "${this.text}",
            style: pEmphTextStyle,
          )
        ],
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  final List<Meeting> meetings;
  final List<Conversation> conversations;

  OverviewPage()
      : meetings = List<Meeting>(),
        conversations = List<Conversation>();

  simulateMeetingsFetched() {
    meetings
      ..add(Meeting(
        name: "Learning Loft",
        location: "Room 1206 - Floor 12",
        startTime: "10:30",
        endTime: "11:30",
        thumbnailPath: "images/airbnb_1.jpeg",
      ))
      ..add(Meeting(
        name: "Learning Loft",
        location: "Room 1206 - Floor 12",
        startTime: "10:30",
        endTime: "11:30",
        thumbnailPath: "images/airbnb_2.jpg",
      ));
  }

  simulateConversationsFetched() {
    conversations
      ..add(Conversation(
          otherPersonName: "Roger",
          messages: [
            "Hey!",
            "These will never be shown.",
            "This is just a model.",
          ],
          profilePicturePath: 'images/32.jpg'))
      ..add(Conversation(
          otherPersonName: "Alex",
          messages: [
            "Hey!",
            "These will never be shown.",
            "This is just a model.",
          ],
          profilePicturePath: 'images/33.jpg'));
  }

  _buildProfileChip() {
    return ClipRRect(
      borderRadius: overEasyBorderRadius,
      child: Image.asset(
        'images/34.jpg',
        fit: BoxFit.cover,
        height: 52,
        width: 52,
      ),
    );
  }

  _buildGreetingHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hey, Zane!',
            style: h1TextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Feb 28th',
            style: h3TextStyle,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildMeetingList() {
    simulateMeetingsFetched();

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        return Container(
          height: 115,
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(20, 20),
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: overEasyBorderRadius,
                  child: Image.asset(
                    meetings[idx].thumbnailPath,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      meetings[idx].name,
                      style: bTextStyle,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      meetings[idx].location,
                      style: pTextStyle,
                    ),
                    TimeText(
                      "${meetings[idx].startTime} - ${meetings[idx].endTime}",
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor,
              ),
            ],
          ),
        );
      },
      itemCount: meetings.length,
      separatorBuilder: (ctx, idx) {
        return Divider(
          height: 1,
          color: Colors.grey,
        );
      },
    );
  }

  _buildPackagesList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        return Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Text(
              "You have 2 new packages",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
      itemCount: 1,
    );
  }

  _buildMessagesList() {
    simulateConversationsFetched();

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        return Container(
          height: 115,
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(20, 20),
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: overEasyBorderRadius,
                  child: Image.asset(
                    conversations[idx].profilePicturePath,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      conversations[idx].otherPersonName,
                      style: bTextStyle,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${conversations[idx].messages.length} New Messages",
                      style: pTextStyle,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor,
              ),
            ],
          ),
        );
      },
      itemCount: conversations.length,
      separatorBuilder: (ctx, idx) {
        return Divider(
          height: 1,
          color: Colors.grey,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PulloverScaffold(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (idx) async {},
          fixedColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.people),
              icon: Icon(
                Icons.people_outline,
                color: primaryColor,
              ),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Community",
                  style: navigationItemTextStyle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.chat_bubble),
              icon: Icon(
                Icons.chat_bubble_outline,
                color: primaryColor,
              ),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Chat",
                  style: navigationItemTextStyle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.notifications_active),
              icon: Icon(
                Icons.notifications_none,
                color: primaryColor,
              ),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Notifications",
                  style: navigationItemTextStyle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_today),
              icon: Icon(
                Icons.calendar_today,
                color: primaryColor,
              ),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Calendar",
                  style: navigationItemTextStyle,
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  _buildProfileChip(),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildGreetingHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                    TableHeaderText("MEETINGS TODAY"),
                    _buildMeetingList(),
                    TableHeaderText("PACKAGES"),
                    _buildPackagesList(),
                    TableHeaderText("NEW MESSAGES"),
                    _buildMessagesList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
