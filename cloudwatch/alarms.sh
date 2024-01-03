aws cloudwatch set-alarm-state --alarm-name "CPUUtilizationTerminateInstance" --state-reason "Testing" --state-value ALARM


# Thresold the state alarm
aws cloudwatch set-alarm-state --alarm-name awsec2-i-076fd965e80e28323-GreaterThanOrEqualToThreshold-StatusCheckFailed_System --state-value ALARM --state-reason "Testing"