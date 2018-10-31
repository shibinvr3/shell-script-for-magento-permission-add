rm -rf var/*
rm -rf pub/static/* 
rm -rf generated/*
chmod 777 var -R
chmod 777 pub/static -R
chmod 777 pub/media -R
chmod 777 generated -R
echo "Cache folders removed... \n"

if [ "$1" = "-u" ]
	then
	rm -rf app/code/Mgt/Varnish/etc/module.xml
	rm -rf app/code/Mgt/Varnish/registration.php
	/opt/lampp/bin/php bin/magento setup:upgrade
	chmod 777 var -R
	chmod 777 pub/static -R
	chmod 777 pub/media -R
	echo "Setup Upgraded... \n"
	notify-send "Setup Upgraded" "Upgraded Magento Schema"
fi

if [ "$1" = "-f" ]
	then
	/opt/lampp/bin/php bin/magento cache:flush
	echo "\nCache Flushed... \n"
	notify-send "Cache Flushed" "Cleared Magento Cache"
fi

if [ "$1" = "-d" ]
	then
	/opt/lampp/bin/php
  en_US en_GB fr_FR -f
	notify-send "Deployed" "Deployed static-content"
fi
if [ "$1" = "-df" ]
	then
	/opt/lampp/bin/php bin/magento setup:static-content:deploy fr_FR -f
	notify-send "Deployed FR" "Deployed FR static-content"

fi

if [ "$1" = "-i" ]
	then
	/opt/lampp/bin/php bin/magento indexer:reindex
	notify-send "Reindexed" "Re-indexed site data"

fi

chmod 777 var -R
chmod 777 pub/static -R
chmod 777 pub/media -R
chmod 777 generated -R
echo "Clean up complete! \n"
