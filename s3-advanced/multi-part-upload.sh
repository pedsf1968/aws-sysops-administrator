BUCKET_NAME=dsfyourbucketnamehere

# create a bucket
aws s3 mb s3://$BUCKET_NAME

# Generate a 100 MB file
dd if=/dev/zero of=100MB.txt bs=1MB count=100

# Split it into 3 parts of 35 MB
split -b 35m 100MB.txt 100MB_part_

# Initiate the multi-part upload
aws s3api create-multipart-upload --bucket $BUCKET_NAME --key 100MB.txt

# get back the upload_id and insert it below
UPLOAD_ID=mzntl8150lXIlnuoTjJNPyyQxiCOhWohEtpFUYeQmvVYrlWGeGwhW72UkRtKAreXUeIRNj5c2CGYECahX_QmGJHOqgoTAgMN0hSEwDn8RmYYpIl3U5XPc4mqL1ABQjNl

# list existing multi part uploads
aws s3api list-multipart-uploads --bucket $BUCKET_NAME

# Upload the parts
aws s3api upload-part --bucket $BUCKET_NAME --key 100MB.txt --part-number 1 --body 100MB_part_aa --upload-id $UPLOAD_ID

aws s3api upload-part --bucket $BUCKET_NAME --key 100MB.txt --part-number 2 --body 100MB_part_ab --upload-id $UPLOAD_ID

aws s3api upload-part --bucket $BUCKET_NAME --key 100MB.txt --part-number 3 --body 100MB_part_ac --upload-id $UPLOAD_ID

# list the parts
aws s3api list-parts --upload-id $UPLOAD_ID --bucket $BUCKET_NAME --key 100MB.txt

# Complete multi-part upload
aws s3api complete-multipart-upload --bucket $BUCKET_NAME --key 100MB.txt --upload-id $UPLOAD_ID --multipart-upload "{\"Parts\":[{\"ETag\":\"cdbd372cb84b1720b94c30cc95d5c4cf\",\"PartNumber\":1},{\"ETag\":\"cdbd372cb84b1720b94c30cc95d5c4cf\",\"PartNumber\":2},{\"ETag\":\"53d2747cf38ca67cfb9c165d90ff896f\",\"PartNumber\":3}]}"
