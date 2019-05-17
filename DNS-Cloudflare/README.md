# DNS-CloudFlare

## Hass.io Custom Domain with free CloudFlare DNS hosting and DDNS

### Features:

* Automatic A record creation with current IP.
* Domain or Subdomain supported.
* Dynamic DNS using the CloudFlare API, monitors changes and updates IP every 5 mins.

## Quick & Dirty get started guide:

### 1. CloudFlare
  - Sign up for free account.
  - Add your base domain (no need to create any DNS records).
  - Make a note of the CloudFlare name servers.
  - Option 1: Set the free SSL option under the crypto menu to "Full (strict)" and enable Universal SSL.
  - Option 2: Turn off the free SSL option under the Crypto menu (SSL to Off & Disable Universal SSL).

### 2. Domain Registrar
  - Change nameservers for your domain to point to Cloudflare.

### 3. Nginx Proxy manager
 - Setup Nginx Proxy manager - https://github.com/hassio-addons/addon-nginx-proxy-manager
  
### 4. Hass.io config
  - Install plugin using /addons directory or GIT
  - Edit config with your CloudFlare Global API Key, your CloudFlare email address and domain.
  - Hit start and wait.

### 4. Homeassistant config
  - Add the following to your configuration.yaml:
```
  http:
    base_url: https://your.domain.com:portnumber
    ssl_certificate: /ssl/fullchain.pem
    ssl_key: /ssl/privkey.pem
    ip_ban_enabled: true
    login_attempts_threshold: 5
```

### 5. Restart homeassistant
  - Profit.

***
Credits & Thanks:
_Let's Encrypt DNS Challenge code based on the Duckdns addon:_
https://github.com/home-assistant/hassio-addons/tree/master/duckdns
Whole adon based on PhrantiK addon for LetsDNS Cloud
https://github.com/PhrantiK/hassio-addons

