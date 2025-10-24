PAYPAL DONTAION  
[![paypal](https://github.com/antoweb/DonateButtons/blob/master/Paypal-160.png?raw=true)](https://www.paypal.me/sistemistaitaliano/2)

BUY ME A COFFEE DONATION
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/sistemistaita)

# awscli-secgroup-dns-to-ip-autoupdate
This bash script create/update automatically a rule in AWS EC2 security group starting from a FQDN (dynamic dns)

With this bash script you can simply add or update a security group aws ec2 rule with a dynamic ip using a Dynamic DNS name.

USAGE ISTRUCTIONS:

**PREREQUISITES:**
- aws cli installed and configured

**Please set the variable in top of script:**

GROUPID=<ID SECURITY GROUP>  --> SECURITY GROUP ID<br />
PROTOCOL=tcp --> PROTOCOL TO OPEN<br />
PORT=22 --> PORT TO OPEN<br />
PROFILE=<MY AWS CLI PROFILE> --> PROFILE OF your aws cli (if you have more than one) else you can keep default<br />
DDNSNAME=<Specifi your fqdn for your dynamic dns name> --> put your dynamic dns name like no-ip or ddns etc...<br />

Copy this script to a machine with aws cli installed

Create a crontab to execute script every 5/10 minutes like:

*/5 * * * * /myscript/awscli-secgroup-dns-to-ip-autoupdate.sh
