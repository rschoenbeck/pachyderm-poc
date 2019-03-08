## Pachyderm basic proof-of-concept

Moves data from Snowflake to S3.

Can deploy a Kubernetes cluster using kops on AWS, give the EC2 instances the same IAM role as the one used to create the Pachyderm deployment (gave full access to S3 + EC2), create the requisite S3 buckets for Pachyderm and Kubernetes state storage, etc.

Make sure to add the indicated secets as outlined in cron.json (e.g. via kubectl).
Then just `pachctl create-pipeline` w/ the cron.json file.
