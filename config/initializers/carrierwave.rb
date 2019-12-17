require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
      region: ENV['AWS_S3_REGION']
    }

    config.fog_directory  = ENV['AWS_S3_BUCKET']
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/laviewapp'
  end
end