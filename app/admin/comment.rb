ActiveAdmin.register Comment, :as => "Topic Comments" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :body, :topic_id
  # config.clear_sidebar_sections!

  # index do
  #   column :body
  #   column :topic_id
  #   column :created_at
  # end

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end
