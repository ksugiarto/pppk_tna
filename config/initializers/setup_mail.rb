ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => 'hanfe.strife@gmail.com',
    :password             => 'ushiwaka06',
    :authentication       => 'login',
    :enable_starttls_auto => true
}