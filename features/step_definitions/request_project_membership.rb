When /^I visit the projects page$/ do
  @project = Project.create!(:name => "TestProject")
  visit(home_projects_path)
end

When /^I click on a project$/ do
  visit(project_path(1))
end

Then /^I should see become a member link$/ do
  page.should have_selector("#requestMembership")
end
