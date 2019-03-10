---
layout: post
lang: ko
permalink: /blog/multilingual-github-page/jekyll-with-polyglot
draft: false
title: "깃허브 블로그 다국어 지원하기"
subtitle: "Jekyll의 플러그인 Polyglot과 함께"
type: "Blog"
blog: true
text: true
author: "Byeongsu Park"
header-img: img/letter.jpg
post-header: true
comments: true
order: 4
---

# Overview
   "다국어를 지원하면 블로그 유입도 많아지겠지?"  
   "내 컨텐츠를 해외 사람들도 보면 좋겠다"  
   하는 생각으로, 최근 블로그에 다국어 기능을 추가했습니다.  

   개발자 냄새 나는게 좋아서 깃허브 페이지를 써왔습니다만,  
   정적 컨텐츠만 서비스가 가능해서 조금 시행착오를 겪었습니다.  

   다국어를 신경쓰는 분이 소수라서 그런지,  
   국내 관련 자료가 많지는 않더군요.

   다른 분들은 시행착오를 줄이는데 조금이나마  
   도움이 됐으면 하네요.

# 목차
   [- Jekyll의 다국어 플러그인, Polyglot](#jekyll의-다국어-플러그인,-polyglot)  
   &nbsp;&nbsp;&nbsp;&nbsp;[   * Polyglot 설치](#polyglot-설치)   
   &nbsp;&nbsp;&nbsp;&nbsp;[   * 설정](#_config.yml-설정)  
   &nbsp;&nbsp;&nbsp;&nbsp;[   * 적용하기](#적용하기)  
   [- 다국어 페이지 SEO 최적화](#다국어-페이지-seo-최적화)  
   &nbsp;&nbsp;&nbsp;&nbsp;[   * 사이트맵](#다국어-페이지를-포함한-사이트맵-생성)  
   &nbsp;&nbsp;&nbsp;&nbsp;[   * 대체 페이지 지정하기](#html태그에-대체-페이지-지정하기)  
   [- 깃허브 페이지에서의 유의점](#깃허브-페이지에서의-주의점)   
   [- 적용후기](#적용후기)  


# Jekyll의 다국어 플러그인, Polyglot
   Jekyll이 기본적으로 다국어 기능을 지원하지 않습니다.  
   그래서 다양한 다국어 플러그인이 있습니다만,

   문서화나 유즈케이스를 보면 대략 아래의 두 개로 간추려 지더군요.

   - [jekyll-multiple-languages-plugin](https://github.com/Anthony-Gaudino/jekyll-multiple-languages-plugin)
   - [Polyglot](https://github.com/untra/polyglot)

   최근까지의 활동을 보면 전자가 관리가 잘 되나,
     
   Polyglot이 SEO최적화 문서화가 잘 되어 있어서
   후자를 선택했습니다.

   ~~어차피 둘다 사이트맵은 제대로 작성 안되니..~~

   본격적으로 다국어 기능을 구현하기 이전에,   
   Github Page에서 해당 기능을 구현 하려고 하시는 분은  
   [깃허브로 푸쉬할 때 유의점](#깃허브-페이지에서의-주의점)을 먼저 읽으시면 좋을 듯 합니다.  

   깃허브의 정책 상 플러그인을 정상적으로 실행하지 못하기 때문에  
   약간 돌아가야 합니다.

## Polyglot 설치 
   다음의 명령어를 통해 플러그인을 설치합니다.

   ```
   gem install jekyll-polyglot
   ```
   
   설치가 완료되면, ```_config.yml```에 플러그인 사용 설정을 해줍니다.    

   ```
   plugins:
      - jekyll-polyglot
   ```

## _config.yml 설정 
   저는 영어와 한국어를 지원하기 위해, 다음과 같이 설정했습니다.  

   ```
   languages: ["en", "ko"] # 지원하고자 하는 언어
   default_lang: "ko" # 컨텐츠의 기본 언어
   exclude_from_localization: ["image"] # 루트 레벨 폴더 중 다국어 기능 제외 시킬 폴더
   parallel_localizaion: false # 윈도우에서는 버그가 있어서 false로 해야 동작한다고 합니다.
   ```

   langauges와 default_lang의 국가코드는
   [링크](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)의 639-1을 참고하세요.

## 적용하기 
   적용하기도 어렵지 않습니다.  
   적용하고자 하는 페이지나 포스트의 YAML에 다음을 추가해주시면 됩니다.

   ```
   lang: <해당 페이지의 언어>
   permalink: <해당 페이지의 url>
   ```

   예를 들면, 현재 해당 기능을 적용한 [머신러닝 스터디잼](https://byeongsupark.github.io/blog/google-ml-studyjam/machine-learning-studyjam)의 포스트는   
   다음과 같이 yaml이 작성되어 있습니다.  

   1. 한국어 포스트의 YAML 
   <br>
   <br>
   ```
   lang: ko
permalink: /blog/google-ml-studyjam/machine-learning-studyjam
   ```

   2. 영어 포스트의 YAML
   <br>
   <br>
   ```
   lang: en 
   permalink: /blog/google-ml-studyjam/machine-learning-studyjam
   ````  
   이렇게 작성을 하면,
   
   _config에 설정한 기본 언어의 포스트는 원래 permalink로 접속할 수 있고,  
   다국어 포스트는  
   ```
   /<해당 언어>/<permalink에 있는 URL>  
   ```    
   로 접속이 가능합니다.  

# 다국어 페이지 SEO 최적화  
   이렇게 다국어 기능 자체는 플러그인을 통해 쉽게 설정이 가능합니다.  
   그러나, 다음과 같은 문제가 있습니다.

   * jekyll-sitemap을 통한 사이트맵 생성 불가
   * 다국어 페이지 SEO 최적화

## 다국어 페이지를 포함한 사이트맵 생성
   SEO를 신경쓰고 계신 분이라면,  
   사이트맵을 자체적으로 제공하고 있을거라 생각합니다.

   아마 크게 
   1. jekyll-sitemap 플러그인을 통한 자동 생성
   2. sitemap.xml을 작성하는 코드를 통한 수동 생성

   이 두가지로 나뉠거라 생각합니다.  

   일단 저는 1번에 해당됩니다만,  
   해당 부류에 속하시는 분은 사이트맵의 url이 한 포스트당 2번씩 생기는 문제가 있습니다. 

   이는 ```Polyglot``` 자체의 처리의 문제이며,  
   앞에서 말씀드린 ```jekyll-multiple-langauges-plugin```에서도 일어나는  문제입니다.

   이미 이슈로 제기되서 그런지,   
   한 분이 수동으로 사이트맵을 생성하는 코드를 제공하셨더라구요.

   jekyll-sitemap 플러그인을 사용하지 마시고,  
   루트 폴더에 sitemap.xml을 다음의 코드로 작성하시면 됩니다.

   [해당 코드 링크](https://github.com/untra/polyglot/issues/29#issuecomment-437914782)

## HTML태그에 대체 페이지 지정하기
   [Google의 다국어 관련 SEO 안내]()에 나오는 방법 중 하나입니다.

   페이지 헤더에 ```<link rel="alternate" hreflang="lang_code" href="url_of_page">``` 요소를 추가하는 방법입니다. 

   일일이 추가하기 매우 귀찮습니다만,  
   **다행히** Polyglot에서는 한 줄의 구문만 추가하면   
   자동으로 설정됩니다.   

   페이지 헤더에    

   {% raw %}
  ```
  {% I18n_Headers %}
  ```
   {% endraw %}

   위 코드를 추가하면, 자동적으로 Polyglot해서 
   해당 구문을 추가해 줍니다.

# 깃허브 페이지에서의 주의점
   지킬 블로그는 깃허브 정책 상 플러그인을 쓰지 못합니다.  
   깃허브 서버에서 악성코드가 돌아가는 것을 방지하기 위해서요.  
   덕분에 Polyglot이나 다른 플러그인을 쓰는 게 어렵긴 하지만,  
   약간의 꼼수로 가능합니다.

## _site를 gh-pages 브렌치로 빌드하기
   예상하셨겠지만, _site내의 컨텐츠들은 gh-pages 브랜치로 푸쉬하고,
   소스는 다른 브랜치에서 관리하는 겁니다.

   꼭 gh-pages 브랜치가 아니더라도 가능합니다.  
   저장소 설정에서 어느 브랜치를 웹페이지로 호스팅 할 건지   
   선택할 수 있거든요.

   별개로 브랜치 관리하기가 귀찮긴 합니다만,
   이것도 스크립트로 자동화가 가능합니다.  
   
   Polyglot에서도 자동화를 권장하고 있습니다.
   다음은 제가 쓰는 스크립트입   니다.

## 자동화
   ```
   git checkout site
   rm -rf _site/
   bundle exec jekyll build
   git add --all
   git commit -m "`date`"
   git push origin site
   git subtree push --prefix=_site/ origin master
   ```

   
# 적용 후기
   영어 하나만 추가했음에도 불구하고,  
   서치 콘솔에서 보면 노출되는 국가 수가 확실히 늘었습니다.

   한국어만 지원했을 때는

   * 한국
   * 일본

   에만 노출되더니,

   영어를 지원한 후에는
   그 외에도

   * 홍콩
   * 필리핀
   * 폴란드
   * 호주
   * 사우디 아라비아
   * 나이지리아
   * 영국
   * 알제리
   
   와 같이 다양한 국가에 노출이 되더군요.  

   영어 포스트 작성 때문에 할 일이 두 배로 늘었습니다만,  
   그만한 가치는 있었네요.

   


   



   