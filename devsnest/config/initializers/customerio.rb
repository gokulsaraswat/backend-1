# frozen_string_literal: true

$customerio = Customerio::Client.new(ENV['CIO_SITE_ID'], ENV['CIO_API_KEY'], region: Customerio::Regions::US)
