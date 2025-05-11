FROM fedora:latest

# Install dependencies
RUN dnf update -y && dnf install -y \
    curl \
    unzip

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \ unzip awscliv2.zip && \ ./aws/install && \ rm -rf awscliv2.zip && \ rm -rf aws

# Set the environment variable for AWS CLI
ENV aws_access_key_id="<YOUR_ACCESS_KEY>"
ENV aws_secret_access_key="<YOUR_SECRET_ACCESS_KEY>"
ENV aws_region="<YOUR_REGION>"
ENV aws_output="json"
#Entry point
CMD ["aws", "--version"]