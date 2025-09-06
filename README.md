---

<h1 align="center">PHPNuxBill</h1>
<h3 align="center">The Free Software For Mikrotik Management</h3>

---

<p align="center">
<img alt="Logo Banner" src="https://raw.githubusercontent.com/animegasan/phpnuxbill/main/src/install/img/logo.png"/>
</p>

---

PHPNuxBill (PHP Mikrotik Billing) is a web-based application (MikroTik API PHP class) Hotspot and PPPOE billing for Mikrotik using the PHP programming language and using the Mikrotik API as communication with the router.
<br>
<br>
The image build on <a href="http://www.alpinelinux.org" target="_blank">Alpine Linux</a> and App PHPNuxBill from <a href="https://github.com/hotspotbilling/phpnuxbill" target="_blank">ibnux</a>.

---

## Supported Architectures
We utilise the docker manifest for multi-platform awareness. Simply pulling ```animegasan/phpnuxbill:latest``` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |
| armhf	| ✅	| arm32v7-\<version tag\> |

---

## Usage
Here are some example snippets to help you get started creating a container.
### docker-compose (recommended)
```yaml
---
version: "2.2"
services:
  mikhmon:
    image: yd2xdt/phpnuxbillclone:latest
    container_name: PHPNUXBILL-Clone
    ports:
      - 8080:80
    restart: unless-stopped
```
### docker cli

```bash
docker run -d \
  --name=phpnuxbill \
  -p 8080:80 \
  --restart unless-stopped \
  YD2XDT/PHPNUXBILL-Clone:latest
```

---

### Install PHPNuxBill
- Open your web browser and visit the url `http://<IP_ADDRESS>:8080/install` to access the PHPNuxBill installer.
- Click Accept & Continue button.
- Click Continue button again.
- Remove all content from the Application URL form.
- Fill in Database Host form with `localhost`.
- Fill in Database Username form with `root`.
- Fill in Database Name form with `phpnuxbill`.
- Click Submit button.
- Click Continue button again.
- Open ssh in docker host.
- Run the command below on docker host to delete the PHPNuxBill installer folder
```bash
docker exec phpnuxbill rm -rf /var/www/html/install
```

---

### Web Interface

Visit the url `http://<IP_ADDRESS>:8080` to have access to the PHPNuxBill's web interface.

And visit the url `http://<IP_ADDRESS>:8080/admin` to have access to the PHPNuxBill's web settings.

-   Default username: `admin`
-   Default password: `admin`

**It's highly recommended to change the default access credentials on first start**.

---

## Packages
The package used by this image are:
- nginx
- php81
- php81-fpm
- php81-gd
- php81-mbstring
- php81-mysqli
- php81-session
- php81-pdo
- php81-pdo_mysql
- mysql
- mysql-client
- supervisor

---

## Version
### 2023.3.12
#### Feature
   - Voucher Generator and Print
   - Self registration
   - Multi Router Mikrotik
   - Hotspot & PPPOE
   - Easy Installation
   - Multi Language
   - Payment Gateway Midtrans, Xendit and Tripay
   - SMS validation for login
   - Whatsapp Notification to Consumer
   - Telegram Notification for Admin

#### Payment Gateway
   - <a href="https://github.com/hotspotbilling/phpnuxbill-tripay" target="_blank">Tripay.com</a> | Indonesia
   - <a href="https://github.com/hotspotbilling/phpnuxbill-xendit" target="_blank">Xendit.com</a> | Indonesia and Philippine ( Philippine not tested )
   - <a href="https://github.com/hotspotbilling/phpnuxbill-duitku" target="_blank">Duitku.com</a> | Indonesia

---

## Credit
[ibnux](https://github.com/ibnux), [Hilman Maulana](https://github.com/animegasan).

---
