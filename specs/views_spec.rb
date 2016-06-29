require './spec_helper.rb'

describe 'Views' do
  describe 'new' do
    let(:view_structure) { Hash.new }
    before do
      allow(DirectoryGetter).to receive(:map_files).and_return(view_structure)
    end

    it 'writes the directory structure to .views as yml' do
      view = Views.new

      expect(ViewWriter).to receive(:write).with(view_structure)

      view.new('test')
    end
  end
end

describe 'DirectoryGetter' do
  describe '.map_files' do
    it 'transforms a list of files into a hash structure' do
      file_list = ['z', '1/a', '1/b', '1/dir/c', '2/d']
      allow(DirectoryGetter).to receive(:list_files).and_return(file_list)
      expect(DirectoryGetter.map_files).to eq({
        'z' => '.',
        'a' => '1',
        'b' => '1',
        'c' => '1/dir',
        'd' => '2'
        }
      )
    end

    it 'handles duplicate filenames' do
    end
  end
end
