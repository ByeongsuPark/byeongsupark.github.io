---
layout: post
lang: ko
permalink: /blog/hacktoberfest/open-source-contribution
draft: false
title:  "Hacktoberfest로 시작하는 오픈소스 입문기"
subtitle: "feat.Mattermost"
type: "Open Source"
blog: true
text: true
author: "Byeongsu Park"
header-img : "img/hacktoberfest.jpeg"
post-header: true
comments: true
order: 5
---

# 멀게만 느껴졌던 오픈소스

![](https://images.velog.io/images/ps3011/post/2b3a85bc-8ffe-4e6c-b2ae-bfe9f7918be3/contribute.png)
오픈소스 컨트리뷰션에는 다양한 방식이 있다.  
오타 고치기 등 문서화(Documentation)에 기여하는 방법도 있고,  
	열린 이슈에서 사람들의 질문에 답변해주는 방법도 있다.  
	물론 코드로 기여하는 방법도 있으나, 뭔가 각잡고 해야되서 약간 부담되는 느낌이랄까..  
	그래서 나는 주로 오타 고치기, 기능 요청 등으로만 기여를 해왔었다.  
	~~즉 코드로는 기여를 한 적이 없었다.~~  
	이번에는 한 번 코드로 기여해보자하는 생각이 들어서, 겸사겸사 핵토버페스트에 참가했다.  
	그 경험을 공유해 보려 한다.  

# 오픈소스와 핵토버페스트  
핵토버페스트는 이름에서도 알 수 있듯, 매년 10월 한 달 동안 열리는 행사이다.  
취지는 오픈소스 기여를 장려하는 것인데, 행사 등록을 마친 후에 핵토버페스트 참가 의사를 표시한 프로젝트에 4개의 PR을 보내고 해당 PR이 성공적으로 승인되면 아래와 같은 티셔츠를 주는 행사다.  
	![hacktoberfest-tshirt](https://images.velog.io/images/ps3011/post/f76f52fa-5dbb-41af-ab98-71401ab9709c/7bpu9vtmpv0ka8kpmyso%20(1).jpg)  
	올해만 그런지는 모르겠는데, 티셔츠 받는 대신 나무 심겠냐고 물어보더라.
# 코드로써의 첫 기여 시작하기  
## 기여할만한 레포 찾기  
이번 핵토버페스트는 [스팸 이슈](https://www.hacktoberfestkorea.com/hacktoberfest_spam_update/)로 인해 hacktoberfest 참가 의사를 표시한 저장소에 PR을 날려야 인정됐다.  
해당 참가의사를 표시한 저장소는 [다음 링크](https://github.com/topics/hacktoberfest)에서 확인이 가능하다.  

나는 저장소를 고르면서 다음과 같은 기준으로 살펴 봤다.  

- 내가 사용하는 언어인지  
- **커뮤니티가 활발한지**  
- 프로젝트가 재미있어 보이는지   

그 중에서도 두번째 기준을 가장 중요하게 두고 찾아봤던 것 같다.  
필자는 그러다가 [Mattermost](https://github.com/mattermost)라는 프로젝트를 알게 되었다.   
![mattermost](https://images.velog.io/images/ps3011/post/baf9360d-dc11-4d15-a587-e0c2fce9c621/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.png)
Mattermost는 슬랙의 대체제를 표방하고 나선 오픈소스 메시지 프로젝트이다.  
회사의 활발한 커뮤니티 문화에 대해서도 할 말이 많지만, 
너무 길어질 것 같아 더 궁금하신 분은 [혜성님의 블로그](https://blog.cometkim.kr/posts/mattermost-contribution/introduction-to-mattermost/)를 들어가보길 추천한다.

서버나 플러그인은 Go로 작성되어 있는데, 이전에 Go를 잠깐 만져본적이 있어서 플러그인에 기여하기로 결정했다.

[웹앱](https://github.com/mattermost/mattermost-webapp)은 자바스크립트로, [모바일](https://github.com/mattermost/mattermost-mobile)은 리액트는 네이티브를 사용하는 것 같으니, 관심있으신 분들은 확인해보시길 바란다.

## 적합한 난이도의 이슈 찾기
Mattermost 레포들의 이슈를 보면서 느낀 점이 라벨링이 체계적으로 잘되어 있다는 것이었다.
![](https://images.velog.io/images/ps3011/post/f77956d0-c07b-4802-8711-d8ec33305184/%EC%9D%B4%EC%8A%88%20%ED%8A%B8%EB%9E%98%EC%BB%A4.JPG)

```Tech/Go```, ```Tech/React Native``` 등 기술 스택별로,
```Difficulty/1:Easy```, ```Difficulty/2:Medium``` 등 난이도 별로 정리가 잘 되어 있다.
처음 기여하는 사람이 해결하기 좋은 이슈도 ```Good first issue``` 로 라벨링 해놓아서 
이슈 필터링만 할 수 있다면 초보자도 기여하기가 쉽다.

## 내가 해결해볼게!!!
위의 사진에서 아래에서 세번째 이슈를 보면 ```Up For Grabs```라고 라벨링되어 있는 것을 볼 수 있다.
아직 아무도 해당 이슈를 맡지 않았다는 것을 의미하는데,  
이런 경우 내가 해보겠다고 Assign 요청을 하면 된다.
![](https://images.velog.io/images/ps3011/post/ff014d47-915c-4ffc-8a00-3c4941bcb573/%EC%96%B4%EC%8B%B8%EC%9D%B8%EC%9A%94%EC%B2%AD.JPG)

그러면 메인테이너가 곧 확인을 하고 Assign을 시켜줄 것이다.
![](https://images.velog.io/images/ps3011/post/3b4f25ef-ad84-4671-903b-e45acf7fa460/%E3%85%87%E3%85%87%E3%85%87.JPG)

해당 이슈에 Assign 됐다면 이제 해당 이슈를 해결해자!

## PR 보내기, 리뷰 그리고 Merged
고맙게도 메인테이너가 비슷한 사례의 PR을 링크해줬다.
덕분에 해당 PR의 코드를 참고해서 어떻게 코드를 수정해야 하는지 결정 할 수 있었다.  
그렇게 해당 이슈를 해결하고 커밋 후 PR을 날리면 이제 리뷰 시간이다.  
Mattermost같은 경우는 Dev 리뷰, QA 리뷰 순으로 진행된다.  

그렇게 리뷰가 정상적으로 끝나게 된다면,,,,

![](https://images.velog.io/images/ps3011/post/c385e31b-d9ef-4eae-a17b-d590b98ef553/%EC%BA%A1%EC%B2%98.JPG)

짠!!! 드디어 PR이 성공적으로 반영됐다.

활발한 커뮤니티와 친절한 메인테이너들 덕분에 이 PR을 시작으로 해서 나머지 3개의 PR도 
어렵지 않게 머지됐다.


	     
# 핵토버페스트를 마치며

오픈소스 활동 하시는 분들을 보면 입문하게 된 다양한 경로가 있다.  
어떤 분은 평소 회사에 쓰는 오픈소스에서 개선점을 찾아서 해결하다보니 자연스럽게 입문하게 된 분도 계시고,그냥 기여 자체를 즐겨서 하는 분들 등 참 다양한 분들이 계신다.  
개인적으로 이런 재밌는 행사를 통해서 오픈소스를 시작 해보는 것도 괜찮은 것 같다.  
올해 10월 또한 나는 핵토버페스트와 함께 보낼 것 같다.  


+++)
![](https://images.velog.io/images/ps3011/post/337877d4-0704-4430-8371-a1c7e8516248/shipping.png)
행사가 끝난지 3개월이 지난 최근에 들어서야 티셔츠를 보냈다는 이메일이 왔다.  
이전 참가 후기들을 보면, 대략 1~2달이면 도착했다고 한다.  
아마 코로나로 인해 지연되지 않았나 싶다.  

