require 'middle_drive'

describe 'Build page.yml from data yml files' do

  it 'should do it right' do
    build_path = 'spec/fixtures'
    MiddleDrive.build_page_yml(build_path)

    pages = YAML.load(File.open("#{build_path}/pages.yml"))
    pages['pages']['en']['article'].should == 'main'
    pages['pages']['en']['blog'].should == 'blog'
    pages['pages']['en']['index'].should == 'index'

    pages['pages']['sl']['article'].should == 'main'
    pages['pages']['sl']['blog'].should == 'blog'
    pages['pages']['sl']['index'].should == 'index'
  end

end
