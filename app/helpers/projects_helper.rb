module ProjectsHelper
  def edit_and_destroy_links
    a = []
    a.push link_to 'Edit', edit_project_path(@project) if can? :edit, @project
    a.push link_to 'Destroy', @project, :confirm => 'Are you sure?', :method => :delete if can? :destroy, @project
    a.join ' - '
  end
end
