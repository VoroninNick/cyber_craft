class AddLinkedinProfileUrlToVacancyRequests < ActiveRecord::Migration
  def change
    add_column :vacancy_requests, :linkedin_profile_url, :string
  end
end
