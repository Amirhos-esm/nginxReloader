
#!/bin/bash
###########

while true
do
 inotifywait --exclude .swp -e create -e modify -e delete -e move /etc/nginx/sites-available/conf/
 if [ $? -eq 0 ]
 then
  echo "Detected Nginx Configuration Change"
  echo "Executing: systemctl reload nginx"
  systemctl reload nginx
 fi
done