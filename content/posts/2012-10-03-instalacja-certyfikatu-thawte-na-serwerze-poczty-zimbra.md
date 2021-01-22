---
title: Instalacja certyfikatu thawte na serwerze poczty zimbra
author: Przemek
type: post
date: 2012-10-03T10:55:33+00:00
url: /instalacja-certyfikatu-thawte-na-serwerze-poczty-zimbra/
bfa_virtual_template:
  - hierarchy
hits:
  - 510
dsq_thread_id:
  - 1028129015
categories:
  - Linux
tags:
  - certyfikaty
  - zimbra

---
## Jak zainstalować certyfikat na Zimbra ?

<!--more-->

Sciagam root ca z tego <a href="https://search.thawte.com/support/ssl-digital-certificates/index?page=content&actp=CROSSLINK&id=AR1470#" target="_blank">linku</a> i zapisuje jako ca_root.crt  
Sciagam ssl intermediate bundle (Download the Bundled CA version) z tego <a href="https://search.thawte.com/support/ssl-digital-certificates/inde?page=content&actp=CROSSLINK&id=AR1372" target="_blank">linku</a> zapisuje jako inter.crt

Łącze powyższe certyfikaty:

<pre class="lang:default highlight:0 decode:true">cat ca_root.crt inter.crt &gt; bundle.crt</pre>

Weryfikacja:

<pre class="lang:default highlight:0 decode:true">/opt/zimbra/zmcertmgr verifycrt comm /opt/zimbra/ssl/zimbra/commercial/domena.key domena.crt bundle.crt</pre>

Jeśli wszystko jest ok to instaluje certyfikat:

<pre class="lang:default highlight:0 decode:true">/opt/zimbra/zmcertmgr deploycrt comm domena.crt bundle.crt</pre>

Następnie restartuje zimbre

&nbsp;