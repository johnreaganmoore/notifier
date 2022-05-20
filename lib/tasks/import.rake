namespace :import do
    desc "Setup pages from csv"
    task import: :environment do
        require 'csv'
        urls_file = 'lib/staff_urls.csv'
    
        ### First create the users for admins
        CSV.foreach(Rails.root.join(urls_file), headers: true) do |row|
            page = Page.where(url: row['staff-directory']).first_or_create(
                url: row['staff-directory'],
            )

            page.css_selector ||= row['selector'] if row['selector'].present?
            page.name ||= row['name'] if row['name'].present?
            page.am_college_id ||= row['am_college_id'] if row['am_college_id'].present?

            page.save
        end
    end
  end
  