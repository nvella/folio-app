fail 'No Google API ID or Secret provided (use $GOOGLE_ID, $GOOGLE_SECRET)' if
  ENV['GOOGLE_ID'].nil? || ENV['GOOGLE_SECRET'].nil?
