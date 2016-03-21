if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '2525',
    authentication: :plain,
    user_name: ENV['app48107732@heroku.com'],
    password: ENV['orhmzvwv4550'],
    domain: 'heroku.com',
    enable_starttls_auto: true
  }
end
