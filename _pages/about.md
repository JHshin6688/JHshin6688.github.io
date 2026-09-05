---
permalink: /
# title: "About"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---


Hello, I am **Jeeho Shin**, a first year MSCS student at Columbia, pursuing ML track.
<br>
Before Columbia, I finished my Bachelor's degree in Computer Science at KAIST.
<br>
My interest lies in multi-agent systems and RAG application, and I enjoy discovering problems around us and solving them through the power of AI.  

<br>

News
=====

| Date | Update |
|------|--------|
| Aug 26, 2026 | Started my Master program at Columbia! |
| Apr 3, 2026 | [TESMR](https://dl.acm.org/doi/10.1145/3805712.3809863) got accepted to **SIGIR 2026**! |
| Sep 1, 2025 | Started my AI R&D internship at NC AI, advised by [Sanghak Lee](https://www.linkedin.com/in/sanghak-lee-817732165/)! |
| Jan 2, 2025 | Started my research internship at KAIST AI, advised by [Dr. Kijung Shin](https://kijungs.github.io/)! |
| Nov 2, 2024 | [ListenUp](https://devpost.com/software/listenup-2qrg3d) won the **Best AI Project with Databricks Open Source** at HackTX 2024! |
{: .news-table}

<br>

Experience
=====

{% for post in site.experience reversed %}
<div class="home-entry">
  <h3 class="home-entry__title">{{ post.company }}</h3>
  <p class="home-entry__body">{{ post.summary }}</p>
</div>
{% endfor %}

<br>

Projects
=====

{% for post in site.portfolio %}
<div class="home-entry">
  <h3 class="home-entry__title"><a href="{{ post.link }}">{{ post.title }}</a></h3>
  <p class="home-entry__body">{{ post.summary }}</p>
</div>
{% endfor %}

<br>

Publications
=====

<div class="publications">
{% for post in site.publications reversed %}
  <div class="publication" id="pub-{{ post.url | slugify }}">
    <div class="publication__thumb">
      <img src="{{ post.thumbnail | default: '/images/publications/placeholder.svg' | relative_url }}" alt="Figure from {{ post.title | escape }}">
    </div>
    <div class="publication__body">
      <div class="publication__title">{{ post.title }}</div>
      <div class="publication__authors">{% for a in post.authors %}{% if a contains site.author.name %}<strong>{{ a }}</strong>{% else %}{{ a }}{% endif %}{% unless forloop.last %}, {% endunless %}{% endfor %}</div>
      <div class="publication__venue"><em>{{ post.venue }}</em>, {{ post.date | date: "%Y" }}{% if post.note %} {{ post.note }}{% endif %}</div>
      <div class="publication__links">
        {%- if post.link %}<a href="{{ post.link }}">Paper</a>{% endif -%}
        {%- for l in post.links -%}
          {%- if l.url %}<a href="{{ l.url }}">{{ l.label }}</a>{% else %}<span class="publication__link--todo" title="Coming soon">{{ l.label }}</span>{% endif -%}
        {%- endfor -%}
        {%- if post.bibtex %}<a href="#bibtex-{{ post.url | slugify }}" class="publication__bibtex-toggle" role="button" aria-expanded="false" aria-controls="bibtex-{{ post.url | slugify }}">BibTeX</a>{% endif -%}
      </div>
      {% if post.bibtex %}<pre class="publication__bibtex" id="bibtex-{{ post.url | slugify }}" hidden>{{ post.bibtex | strip | escape }}</pre>{% endif %}
    </div>
  </div>
{% endfor %}
</div>
<script>
  document.querySelectorAll('.publication__bibtex-toggle').forEach(function (toggle) {
    toggle.addEventListener('click', function (event) {
      event.preventDefault();
      var target = document.getElementById(toggle.getAttribute('aria-controls'));
      var isOpen = !target.hidden;
      target.hidden = isOpen;
      toggle.setAttribute('aria-expanded', String(!isOpen));
    });
  });
</script>
