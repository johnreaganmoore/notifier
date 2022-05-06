namespace :import do
    desc "Setup pages from csv"
    task import: :environment do
        require 'csv'
        urls_file = 'lib/staff_urls.csv'
    
        ### First create the users for admins
        CSV.foreach(Rails.root.join(urls_file), headers: true) do |row|
            page = Page.create(
                name: row['URL'],
                url: row['URL'],
                css_selector: "table.sidearm-table"
            )
        end
    end
  end
  