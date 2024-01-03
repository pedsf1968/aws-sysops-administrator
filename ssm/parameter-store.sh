# get parameter
aws ssm get-parameters --name /my-app/dev/db-url /my-app/dev/db-password

aws ssm get-parameters --name /my-app/dev/db-url /my-app/dev/db-password --with-decryption

aws ssm get-parameters-by-path --path /my-app/dev/  --with-decryption


aws ssm get-parameters-by-path --path /my-app/  --with-decryption --recursive