import 'package:flutter/material.dart';

class mediaqueryDesing extends StatefulWidget {
  const mediaqueryDesing({super.key});

  @override
  State<mediaqueryDesing> createState() => _mediaqueryDesingState();
}

class _mediaqueryDesingState extends State<mediaqueryDesing> {
  final List<CourseCard> courses = [
    CourseCard(
      title: "Full Stack Web Development with JavaScript (MERN)",
      participants: 73,
      duration: 90,
      flagCode: "us",
    ),
    CourseCard(
      title: "Full Stack Web Development with Python, Django & React",
      participants: 86,
      duration: 75,
      flagCode: "nl",
    ),
    CourseCard(
      title: "App Development with Flutter",
      participants: 62,
      duration: 60,
      flagCode: "in",
    ),
    CourseCard(
      title: "Full Stack Web Development with PHP, Laravel & Vue Js",
      participants: 89,
      duration: 85,
      flagCode: "ch",
    ),
    CourseCard(
      title: "Full Stack Web Development with ASP.Net Core",
      participants: 75,
      duration: 80,
      flagCode: "us",
    ),
    CourseCard(
      title: "SQA: Manual & Automated Testing",
      participants: 67,
      duration: 65,
      flagCode: "uk",
    ),
    CourseCard(
      title: "Mastering DevOps: From Fundamentals to Advanced Practices",
      participants: 72,
      duration: 70,
      flagCode: "ca",
    ),
    CourseCard(
      title: "Coding Interview Preparation (Local+Remote Job)",
      participants: 95,
      duration: 45,
      flagCode: "de",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2; // Default for Mobile (Pixel size < 768)

    if (screenWidth > 1024) {
      crossAxisCount = 4; // Desktop/web size (Pixel size > 1024)
    } else if (screenWidth > 768) {
      crossAxisCount = 3; // Tablet Size (1024 >= Pixel size > 768)
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Course Catalog'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 17.0,
            mainAxisSpacing: 17.0,
            childAspectRatio: 0.7, // Adjusted to prevent overflow
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCardWidget(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class CourseCard {
  final String title;
  final int participants;
  final int duration;
  final String flagCode;

  CourseCard({
    required this.title,
    required this.participants,
    required this.duration,
    required this.flagCode,
  });
}

class CourseCardWidget extends StatelessWidget {
  final CourseCard course;

  const CourseCardWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Flag section with reduced height
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: 120, // Reduced height
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.network(
                        'https://flagcdn.com/w320/${course.flagCode}.png',
                        fit: BoxFit.contain,
                        height: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'FULL STACK',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.people, size: 14, color: Colors.grey),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              '${course.participants} টি বাকি',
                              style: const TextStyle(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              '${course.duration} দিন বাকি',
                              style: const TextStyle(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6), // Reduced spacing
                // Title section with reduced height
                SizedBox(
                  height: 38, // Reduced height
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 13, // Slightly smaller font
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6), // Reduced spacing
                // Button with reduced padding
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5), // Reduced padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'বিস্তারিত দেখি',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
