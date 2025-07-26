aws ecr get-login-password --region ${region} \
  | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.${region}.amazonaws.com

docker run -d -p 1337:1337 \
  ${account_id}.dkr.ecr.${region}.amazonaws.com/strapi:${image_tag}
