## Pachyderm basic proof-of-concept

Extracts loan features from Snowflake, does some dimensionality reduction, then exports results to S3.

Can deploy a Kubernetes cluster using kops on AWS, give the EC2 instances the same IAM role as the one used to create the Pachyderm deployment (gave full access to S3 + EC2), create the requisite S3 buckets for Pachyderm and Kubernetes state storage, etc. See [tutorial here](https://pachyderm.readthedocs.io/en/latest/deployment/amazon_web_services.html#manual-pachyderm-deploy).

Make sure to add the indicated secets as outlined in cron.json (e.g. via kubectl).
Then just `pachctl create-pipeline` w/ the cron.json and transform.json files.
