fail 'No Google API ID or Secret provided' if ENV['GOOGLE_ID'].nil? ||
  ENV['GOOGLE_SECRET'].nil?
