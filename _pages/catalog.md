---
layout: page
permalink: /catalog/
title: catalog
description: "Click the cards below for more information."
nav: true
nav_order: 3
horizontal: true
---

Click a card below for more details.

<!-- pages/catalog.md -->
<div class="catalog">
{% if site.enable_catalog_categories and page.display_categories %}
  <!-- Display categorized catalog -->
  {% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  {% assign categorized_catalog = site.catalog | where: "category", category %}
  {% assign sorted_catalog = categorized_catalog | sort: "importance" %}
  <!-- Generate cards for each catalog -->
  {% if page.horizontal %}
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for catalog in sorted_catalog %}
      {% if catalog.show  %}
        {% include catalog_horizontal.liquid %}
      {% endif %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for catalog in sorted_catalog %}
      {% include catalog.liquid %}
    {% endfor %}
  </div>
  {% endif %}
  {% endfor %}

{% else %}

<!-- Display catalog without categories -->

{% assign sorted_catalog = site.catalog | sort: "importance" %}

  <!-- Generate cards for each catalog -->

{% if page.horizontal %}

  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for catalog in sorted_catalog %}
      {% if catalog.show  %}
        {% include catalog_horizontal.liquid %}
      {% endif %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for catalog in sorted_catalog %}
      {% include catalog.liquid %}
    {% endfor %}
  </div>
  {% endif %}
{% endif %}
</div>
---
