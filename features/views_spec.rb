require 'yaml'

describe 'views' do
  test_dir = File.dirname(__FILE__)
  app_dir = File.dirname(test_dir)
  pwd = Dir.pwd

  before do
    `cp -r #{test_dir}/test-examples #{test_dir}/examples`
    Dir.chdir("#{test_dir}/examples")
  end

  after do
    Dir.chdir(pwd)
    `rm -rf "#{test_dir}/examples"`
  end

  describe 'new' do
    it 'creates a view file' do
      `#{app_dir}/bin/views new mvc`
      expect(File).to exist('.views')
    end

    it 'saves the directory structure as yml' do
      `#{app_dir}/bin/views new mvc`
      views_hash = YAML.load_file('.views')

      expect(views_hash).to eq({
        '1.a' => {
          :view => 'mvc',
          :tag => '1'
        },
        '2.a' => {
          :view => 'mvc',
          :tag => '2'
        },
        '3.a' => {
          :view => 'mvc',
          :tag => '3'
        },
        '1.b' => {
          :view => 'mvc',
          :tag => '1'
        },
        '2.b' => {
          :view => 'mvc',
          :tag => '2'
        },
        '3.b' => {
          :view => 'mvc',
          :tag => '3'
        },
        '1.c' => {
          :view => 'mvc',
          :tag => '1'
        },
        '2.c' => {
          :view => 'mvc',
          :tag => '2'
        },
        '3.c' => {
          :view => 'mvc',
          :tag => '3'
        }
      })
    end
  end
end
