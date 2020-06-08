### ymparistosuunnittelija.com
   check host ymparistosuunnittelija.com with address www.ymparistosuunnittelija.com

   # ICMP check
     if failed icmp type echo
        for 2 times within 2 cycles
        then alert

   # HTTPS check
      if failed port 443 type tcpSSL protocol http
        with http headers [Host: www.ymparistosuunnittelija.com, Cache-Control: no-cache]
          and request /pong with content = "www.ymparistosuunnittelija.com"
        then alert
