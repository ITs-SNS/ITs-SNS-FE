import 'package:flutter/material.dart';
import '../jobs.dart';
import '../jobs_card.dart';

List<Jobs> jobsList = [
  Jobs(
    company: '네이버',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view?csn=SWxVaDVyUmRXSDVlcHZDWk5sbzdJQT09',
    keywords: ['클라우드', 'iot', 'AI', '자연어 처리', 'nlp', 'spring', 'nodejs', 'web3'],
  ),
  Jobs(
    company: '네이버',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view?csn=SWxVaDVyUmRXSDVlcHZDWk5sbzdJQT09',
    keywords: ['클라우드', 'iot', 'AI', '자연어 처리', 'nlp', 'spring', 'nodejs', 'web3'],
  ),
  Jobs(
    company: '네이버',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view?csn=SWxVaDVyUmRXSDVlcHZDWk5sbzdJQT09',
    keywords: ['클라우드', 'iot', 'AI', '자연어 처리', 'nlp', 'spring', 'nodejs', 'web3'],
  ),
  Jobs(
    company: '네이버',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view?csn=SWxVaDVyUmRXSDVlcHZDWk5sbzdJQT09',
    keywords: ['클라우드', 'iot', 'AI', '자연어 처리', 'nlp', 'spring', 'nodejs', 'web3'],
  ),
  Jobs(
    company: '네이버',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view?csn=SWxVaDVyUmRXSDVlcHZDWk5sbzdJQT09',
    keywords: ['클라우드', 'iot', 'AI', '자연어 처리', 'nlp', 'spring', 'nodejs', 'web3'],
  ),
  Jobs(
    company: '카카오',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '카카오',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '카카오',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '카카오',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '카카오',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '라인',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '라인',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '라인',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '라인',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '라인',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['spring', '백엔드', '프론트엔드', '안드로이드', 'ios', '개발 싫어', 'internship', 'hello world'],
  ),
  Jobs(
    company: '백수',
    url: 'https://www.saramin.co.kr/zf_user/company-info/view/csn/SWxZTDB4NDZWTDRFSnQ3N3krT080dz09/company_nm/(%EC%A3%BC)%EC%B9%B4%EC%B9%B4%EC%98%A4',
    keywords: ['졸업', '백수', '언제 취직할까'],
  ),
];

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  int page = 1;
  bool isLoading = false;

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 2));
    print("load more");
    setState(() {
      jobsList.add(jobsList[jobsList.length - 1]);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: <Widget> [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading && scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },
              child: ListView.builder(
                itemCount: jobsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: JobsCard(
                      jobs: jobsList[index],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Widget jobPage = ListView.builder(
//   itemCount: jobsList.length,
//   itemBuilder: (context, index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
//       child: JobsCard(
//         jobs: jobsList[index],
//       ),
//     );
//   },
// );

