# How to Create (or Update) Free SSL Certificates -- UNDER CONSTRUCTION

This tutorial is for setting up free SSL certificates on web apps deployed to Heroku. This process gives you the certificates at absolutely no $ cost but they have to be manually renewed every 3 months or so.

## 1 - Go to sslforfree.com and insert your domain (importante: insert ALL DOMAINS separated by spaces, in my case www.thelisbonvr.com thelisbonvr.com the-lisbon-vr-herokuapp.com ).

## 2 - If you're updating certificates just follow the link on the "SSL Certificate Expiring" email

## 3 - Select "Manual Verifiation (DNS)"

## 4 - Go to your web host (GoDaddy, Blue Host, etc) and add the 2 DNS records (TXT)

## 5 - Dowload the zip file that SSLforfree gives you (with 3 files)

## 6 - Create an account or login so that you get notified when the certificate is about to expire

## 7 - Unzip the contents to your app's root folder (CA_bundle.crt, certificate.crt and private.key)

## 8 - Intall the certificates on Heroku
https://www.namecheap.com/support/knowledgebase/article.aspx/9756/0/heroku

Combine the certificate and ca_bundle into one file
$ cat certificate.crt ca_bundle.crt > server.crt

Add certificate:
$ heroku certs:add server.crt private.key

Update certificate:
$ heroku certs:update server.crt private.key

## 9 - Verify that your app is running the certificates.
Run the following for all your domains:
```$ openssl s_client -connect <dns target>:443 -servername <your domain>```

In my case:
```$ openssl s_client -connect www.thelisbonvr.com.herokudns.com:443 -servername www.thelisbonvr.com
$ openssl s_client -connect thelisbonvr.com.herokudns.com:443 -servername thelisbonvr.com
$ openssl s_client -connect the-lisbon-vr.herokuapp.com.herokudns.com:443 -servername the-lisbon-vr.herokuapp.com```
