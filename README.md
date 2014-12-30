dockerpaas
==========
a private PaaS using Docker based upon CloudFoundy and Stackato

Prerequisites
--------------
You need to have:
- Python 
- Amazon AWS CLI   (sudo pip install awscli)
- jq               (brew install jq)
- jinja2           (sudo pip install jinja2)
- Power user and IAM privileges on your AWS account
- 5 elastic IP addresses available on your AWS account 
- a stackato license  (Goto https://account.activestate.com/stackato/free_license/)


INSTALL
-------
The script has only been tested on MacOS, so if you find any platform specific issues please let me know!

- checkout this repository 
- move into the directory dockerpaas
- now type:
-     bin/create-ha-stackato-on-aws.sh -d <DNS domain-name> -o <organization> -l <Stackato License> -u <admin email address> 

USAGE
-----
```
create-ha-stackato-on-aws.sh
  creates a stackato multinode deployment, with at least 1 cloudcontroller, 1 router, 1 dea and 1 data-services node.

  -d domain-name 
    the DNS domain name under which the PaaS can be reached (eg. paas.xebia.com)
  -o organization
    owning the instance (eg. Xebia)
  -l license
    The stackato license to activate 
  -u email
    the admin user email address
  -h 
    If you want a multi availability zone deployment (high availability)
  -d number-of-deas
    Number of DEAS in each region, defaults to 1.
  -r region
    AWS region to deploy, currently only eu-west-1 and eu-central-1 are supported.
```
