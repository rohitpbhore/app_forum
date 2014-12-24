ActiveAdmin.register Topic do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # clear_sidebars
  permit_params :title, :tag_list, :forum_id
  config.clear_sidebar_sections!

  # index do
  #   column :id
  #   column :name
  # end
  # default_actions

  # index :download_links => false do
  # end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end


  
