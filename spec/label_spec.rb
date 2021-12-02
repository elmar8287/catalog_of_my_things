require_relative '../label'

describe Label do
  before do
    @label = Label.new('Test Label', 'red')
  end

  it 'should have a title' do
    @label.title.should == 'Test Label'
  end

  it 'should have a color' do
    @label.color.should == 'red'
  end

  it 'should have an id' do
    @label.id.should_not be_nil
  end

  it 'should have an items array' do
    @label.items.should be_an_instance_of(Array)
  end
end
