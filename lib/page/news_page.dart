import 'package:flutter/material.dart';
import '../news.dart';
import '../news_card.dart';

List<News> newsList = [
  News(
    title: '삼성, \"갤럭시폴드\" 탑재 폴더블 디스플레이 본격 출하',
    contents: '삼성디스플레이는 지난 9일 아산캠퍼스에서 폴더블 제품의 성공적인 양산을 기념하고 프로젝트에 참여했던 임직원들의 노고를 치하하기 위해 폴더블 디스플레이 출하기념식을 열었다.',
    url: 'https://news.v.daum.net/v/20220510001025990',
    keywords: ['삼성전자', '디스플레이', '갤럭시폴드', '아산캠퍼스', '삼성전자', '디스플레이', '갤럭시폴드', '아산캠퍼스'],
  ),
  News(
    title: '여론 악화되자...KT, 5G 데이터 \'용량제한\' 삭제',
    contents: '9일 이통업계에 따르면 KT가 5G 데이터 무제한 요금제에 포함된 "데이터 제한 조항"을 삭제하고 LG유플러스도 조만간 관련 조항을 삭제할 것으로 예상된다.',
    url: 'https://news.v.daum.net/v/20220510043015323',
    keywords: ['KT', '이통업계', '데이터', '제한', 'LG유플러스', 'KT', '이통업계', '데이터', '제한', 'LG유플러스'],
  ),
  News(
    title: 'V50 씽큐\'G8 씽큐\'에 인공지능 적용...LG전자 \"키워드만 적으면 사진·문자 찾아줘\"',
    contents: 'LG전자는 오는 19일 출시하는 첫 5세대(5G) 스마트폰 \'V50 씽큐\'에 더 똑똑해진 인공지능(AI) 기능을 적용했다고 9일 밝혔다.',
    url: 'https://news.v.daum.net/v/20220509231012393',
    keywords: ['LG전자', '스마트폰', '인공지능(AI)', '5G', '스마트폰', '인공지능(AI)', ',5G'],
  ),
  News(
    title: '11인승 승합차 이어 장기 렌터카까지...규제 틈새 활용한 \'제2 타다\' 등장',
    contents: '모빌리티 스타트업인 차차크리에이션은 9일 서울 역삼동 워크플렉스에서 기자간담회를 열어 장기 렌터카와 대리운전을 결합한 개인 간 거래(P2P) 승차공유 서비스 \'차차\'를 공개했다.',
    url: 'https://news.v.daum.net/v/20220509215900724',
    keywords: ['모빌리티,' '차차크리에이션', '워크플렉스', '기자간담회', '렌터카', '대리운전''차차크리에이션', '워크플렉스', '기자간담회', '렌터카', '대리운전'],
  ),
  News(
    title: '닥스콘·반올림에이드 \“스포츠콘텐츠·ICT 융합해 체육인 사회진출 견인\”',
    contents: '닥스콘(대표 정기태)은 경기도교육청과 한국여자농구연맹(WKBL)이 협력·진행하는 초등학교 방과후 농구체육수업에 PDF 기반 디지털 전자교재를 공급해 스포츠 교육 콘텐츠와 ICT 융합사업을 적극 확대하겠다고 밝혔다.',
    url: 'https://news.v.daum.net/v/20220509195115895',
    keywords: ['닥스콘', '초등학교', 'PDF', 'ICT', '디지털전자교재', '닥스콘', '초등학교', 'PDF', 'ICT', '디지털전자교재'],
  ),
  News(
    title: '2페이지',
    contents: '이것은 2페이지다',
    url: 'https://maple19out.tistory.com',
    keywords: ['티스토리', 'maple19out', '세계 최고 해커'],
  ),
];

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int page = 1;
  bool isLoading = false;

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 2));
    print("load more");
    setState(() {
      newsList.add(newsList[newsList.length - 1]);
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
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: NewsCard(
                      news: newsList[index],
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