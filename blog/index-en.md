---
layout: default
lang: en 
permalink: /blog/
title: "Blog"
main: true
project-header: true
header-img: img/about.jpg
description: Writing a post occasionally
---

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
