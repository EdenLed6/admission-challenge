#!/bin/bash

# 1. looking in the Apache configuration file

# cat ../../etc/apache2/apache2.conf

# 2. finding the sites-enabled directory
# cd /etc/apache2/sites-enabled/

# 3. runing Ls to see what we have there
# ls

# 4. reading the 000-defaul
# cat 000-default.conf

# 5. Remove the offending lines from 000-default.conf
 sudo sed -i '/<Location "\/">/,/<\/Location>/d' /etc/apache2/sites-enabled/000-default.conf


# 6. restart the apache
 sudo systemctl restart apache2

# 7. refresh the web page
